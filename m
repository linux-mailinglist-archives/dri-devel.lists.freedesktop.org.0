Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8C8BD1D38
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9131110E3E0;
	Mon, 13 Oct 2025 07:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8FE010E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 01:03:29 +0000 (UTC)
X-AuditID: a67dfc5b-c2dff70000001609-68-68ec4fde8eb0
Date: Mon, 13 Oct 2025 10:03:21 +0900
From: Byungchul Park <byungchul@sk.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, kernel_team@skhynix.com,
 torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
 joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
 duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org,
 tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
 ngupta@vflare.org, linux-block@vger.kernel.org,
 josef@toxicpanda.com, linux-fsdevel@vger.kernel.org, jack@suse.cz,
 jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
 djwong@kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com,
 longman@redhat.com, yunseong.kim@ericsson.com, ysk@kzalloc.com,
 yeoreum.yun@arm.com, netdev@vger.kernel.org,
 matthew.brost@intel.com, her0gyugyu@gmail.com,
 catalin.marinas@arm.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org,
 christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 rppt@kernel.org, surenb@google.com, mcgrof@kernel.org,
 petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
 paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org,
 joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
 qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 chuck.lever@oracle.com, neil@brown.name, okorniev@redhat.com,
 Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org,
 anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de,
 clrkwllms@kernel.org, mark.rutland@arm.com, ada.coupriediaz@arm.com,
 kristina.martsenko@arm.com, wangkefeng.wang@huawei.com,
 broonie@kernel.org, kevin.brodsky@arm.com, dwmw@amazon.co.uk,
 shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com,
 usamaarif642@gmail.com, joel.granados@kernel.org,
 richard.weiyang@gmail.com, geert+renesas@glider.be,
 tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it,
 guoweikang.kernel@gmail.com, link@vivo.com, jpoimboe@kernel.org,
 masahiroy@kernel.org, brauner@kernel.org,
 thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com,
 andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v17 28/47] dept: add documentation for dept
Message-ID: <20251013010321.GA52546@system.software.com>
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-29-byungchul@sk.com>
 <87ldlssg1b.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldlssg1b.fsf@trenco.lwn.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH87v3d29vG2uuFcNvkCVbnTE04mMx5vyxqJuJuYQsumG2ZGbZ
 bqRZq7zWymvJljIKQzRbdQFCAWlRK0IR1iIoDoM0Y3alSmVox0ZR7AB5yKaUhzpYL2aZ/5x8
 8j0n3/PI4WhVDRvH6TOOag0ZYpqaVWDF9Cp74vC+Kd3WZ9cTIDJbgqG62clCiauSgb6LjQiG
 IyUIiq4sY5hd/F0Gy509CJ60LLEw6XmMoOJhAYYZxwkEy0NjFDjCSxSEu75B8E/5Eaitc7Pw
 zH+LBvv9IRrGW6J6a08IQX94NfwamWHBW3achelANQU1VacQFJ5pZiEw+ZyCRte74LPUUdEG
 LJT/EAtVFYVUNIxTUNZ0lYJFR4MMHKYNUOXvZ2Ck3hqdzJYJPY1jMhj6rgzDxelbDEyOnmKh
 3XRPBq7ffkJQ0hHB4HpwhwF78VkMlaf/YOHHTi+G/o5qFk60XGIg5FxmwFQ1H12+y8dA81iQ
 Al/PDQxe6wUM9+8FGXD7e2kIWv5E0PSoLnqGOQe9O1WYL/oWCw3uNkpwnnYiYfZcIS0UWaLk
 mZqhBbM7Vzjnm2KFp5EBVuics2HhlzoinPQnClesQzLBfG1QJthc2YK7XrM/8SPFW6naNH2O
 1rBl56cKnaczhLPOsHn14fdNqJgpRXKO8NuJwzeBShG3wkG7QZIxv4H0Pr3ESszyG0kwuEhL
 JTH8G2Ti2AelSMHR/Pl48v1ozUrNWn4XuTngRBIreSA1Ac8Kq3gzIn/3ii/0NcRbGcYS07yG
 BJceUpInzceT80ucJMv5TWTeMkJLvI5fT7rafqakXoQflZPqghB6MfIr5Hp9EFsQb33J1vqS
 rfV/WxuiG5BKn5GTLurTtm/W5Wfo8zYfykx3oejTOr58fvAyetyX0o14DqlXKXVXJ3UqRswx
 5qd3I8LR6hjlyeJxnUqZKuZ/oTVkfmLITtMau1E8h9WxyjfnclNV/GfiUe0RrTZLa/gvS3Hy
 OBNKTkjI3ZEd9478wrUHE0/yyre0epKTim6KC5rBvUnp9h3v/cVS3YrXFYMHYu4Gbnw+0n7Q
 vL+jaeOj2Nsfakwtx3et3rPPf/vjA1lfDx7L2Z3k7F//Vcrb87XimgLzApXcW7vXtGfAdji8
 ra3JuNblzeoThgMpr7XufHVhbGvKppCuvUKNjTpxm4Y2GMV/AZ3vxSmwAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxbZRTHfe7Lc28bO68VtycjfrDuJRJBl+k8cUaXqNkNUXQz2Xxjrt2u
 tuGlyy3D4WLCWxFxaqlp2dp1MtgKgbJ1BRaRdEEaWbaBDJFRdYV1qQxGkaiwhgLFdsa4Lye/
 8z///8n5cHhaHWfX8obCIkku1OZrsJJR5mytyBx7Pap/ytWWBdfKehiYn6tm4PhZD4Zq3zEW
 rp5pRTA+X40gtuikwdy1wsCytY+DuYXfOFjx9yGwD1lp8HSUUfC3N4FhOvAXAls4gqFuqoyB
 WfcRBI4JJwdTP2yHmfFuFlZCtygYvRNF4I4kKIj0fIpg2Z4H3zS0Y1gcGKShznYVwclwiIZJ
 b3LY0TeGwN9cjuF3SycNw5FV8PP8LIZLts8xzAwdp+APL4b6cj8LLqcVQUXjWQx2l4+Brhvf
 cTA0vUTBdbuVglbfazDunmDgiqWBSt6XdJ1bA866CipZJimwtXVTsOBu4aC/8ToD7tL14BwY
 ZuFms4ODpfAmWKk3Ql/rLQ5CX9kYODMzyG6zITFm/pIRW9rPU6L5p2Usek54kLgYtyJx7nQF
 LZotyTYQnaXFyvaPxNNXoliMz49g0X+nnhEvNxCxdiBT7HKEOLHywq/cG8+9o3x+v5RvKJbk
 J1/Yq9QH/GPMgUZ8qDmysxRVsTWI54nwNAmelGuQgmeE9aQ/3olTjIWNJBhcoFOWNGEduf3Z
 rhqk5GmhKZ18PeG663lIeJH8OOJBKVYJQFxDgbusFioR+bNf+6/+ILl0LMKkmBYySDAxRaV2
 0kI6aUrwKVkhPEFilpt0ih8WHiM95y9SFqRy3JN23JN2/J+uR3QLSjMUFhdoDfnPZJny9CWF
 hkNZ+4wFPpT8SPcnS7Xfornh7b1I4JHmfpW+e1qvZrXFppKCXkR4WpOmqq2a1KtV+7UlH0uy
 8X35YL5k6kXpPKNZo8reLe1VCx9qi6Q8STogyf9NKV6xthS5r+VIl2U245eD0cAjh+/b4jWe
 em/j6Pe6dFfuznc/CDlWb6jLzlzep9PZSXlr7aPPvt0SfOXwjuwLqzdn9DpHXlLciK17tWkC
 F9U8MCX4ir2d4qqcPbmzm31HwqNuz+Dtl+UtRp05trVKEX/z8Q7YlgiVNOTKF0+95Qwf5dp0
 G77QMCa9dlMGLZu0/wCekX8tjQMAAA==
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 13 Oct 2025 07:35:26 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 02, 2025 at 11:36:16PM -0600, Jonathan Corbet wrote:
> Byungchul Park <byungchul@sk.com> writes:
> 
> > This document describes the concept and APIs of dept.
> >
> > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > ---
> >  Documentation/dependency/dept.txt     | 735 ++++++++++++++++++++++++++
> >  Documentation/dependency/dept_api.txt | 117 ++++
> >  2 files changed, 852 insertions(+)
> >  create mode 100644 Documentation/dependency/dept.txt
> >  create mode 100644 Documentation/dependency/dept_api.txt
> 
> As already suggested, this should be in RST; you're already 95% of the
> way there.  Also, please put it under Documentation/dev-tools; we don't
> need another top-level directory for this.

Sure.  I will.  Thanks!

	Byungchul
> 
> Thanks,
> 
> jon

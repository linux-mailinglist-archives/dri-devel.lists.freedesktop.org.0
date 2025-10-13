Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625BBD1D35
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E6010E3DE;
	Mon, 13 Oct 2025 07:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19DB710E032
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:27:30 +0000 (UTC)
X-AuditID: a67dfc5b-c45ff70000001609-4f-68ec8dc159b9
Date: Mon, 13 Oct 2025 14:27:24 +0900
From: Byungchul Park <byungchul@sk.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
 matthew.brost@intel.com, her0gyugyu@gmail.com, corbet@lwn.net,
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
Subject: Re: [PATCH v17 35/47] i2c: rename wait_for_completion callback to
 wait_for_completion_cb
Message-ID: <20251013052724.GA9169@system.software.com>
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-36-byungchul@sk.com>
 <aOFNz2mKXCXUImwO@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOFNz2mKXCXUImwO@shikoro>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH87v3dx80NrleNP6wW9w6mQnxMTYNJ07JYrLs/mOyZbqZGR8N
 vbGdpZiiIEMy0VZZo13FGLT4QKpYASO5yMsHwc5MiUZ5VKiCqMDQrhRMeYVI6npZlvnPySfn
 fM/3e/44PC0+ZhbyZutu2WY1WPSsBmsic8qX+Y8Omz47qcyHifEiDEXKKQam3pbS4Gh6h2F8
 uoeDsZoYC+E/oghKQoUYuieHEQQmRlkYqWGhPTxDwfOKIQz33eVUXMFCaclrCvp9Hg5mXqZC
 a18XA+GhYhaUgTj92dhPQef10ywcqaljoK/6HQMdVW0Yrr4KUvDo+hUGXr4IMjDp0kHbsaMM
 XBkpZ6HwthfD0ONDFEQvTGI4NBZj4PDrGyz0uv7G0Fz0goKLvggDxzvKWKhVTtDQVXyOhX5X
 hIPombjYcWSag8Kx5wjsvatgxD3OfJUqTTlcWKo+W40khzte7LW5UpPnGSfZm59yUpmyR7Lf
 iTBSrS9F8t4MUZJS+RsrKdFiTnJGApQ08vAhJ907+RZLg4ES6tsPftKsMcoWc45sW5G+XWM6
 cSl51zC790LvaW4/amKcKIEnwkrS2RxGTsTP8oGOJLWNhWRyuKUGqcwKS0gwOE2rPE/4glQf
 LOWcSMPTQoOOtF8boNXdRCGDXLUvVlErpJF7nV+rclH4lYz6y2ZXtcJc0npqEKtMCykkGAtR
 qpwWdORSjFfbCfGkmb9cs4fNFz4hLfV3KTWJCH0JpLt3gP334iRy2xfEbiR43rP1vGfr+d+2
 DNGVSDRbczINZsvK5aY8q3nv8oysTAXFn62iYGZzI4q2fe9HAo/0c7SmG2GTyBhysvMy/Yjw
 tH6eNi1/2CRqjYa8X2Rb1jbbHouc7Uc6HusXaD+fzDWKwg7DbnmnLO+Sbf9NKT5h4X5UqcXp
 i3ryM57EIoGsdVt2apb1bDgjcl2bxMTuUKOv4Nnq+jSz8+MPHxWOjmp+/2hr+8/pa9/ccXxn
 C+rqA5dzqqqWWti7i1oabj0Y/HRuaWt3sgKrJ9ZtPM89Tc31GluTCribjQ57ft2UVzzf5y3/
 wWo9ENr+ZZ57/Y/H9qGw8Rs9zjYZUlNoW7bhH6va14BoAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH89znvtGs89JBeJTsS5FoNKAGDWdDDXGZ3G3ZwjeWfZmd3tgG
 KNpKJy7bgFJguDmoaYktzgpaGK3Q8aIWU9ZhYAISBWQjG8iYRSWWNZmgqbytd8kyv5z8zjn/
 X87z4eGxKsps4nX6E5JBrylQswpa8UGWOe2nb8Lanb7O7fBLWZCGpcVqGhravSxUd5xj4G6b
 B8HMUjWC58tODBb/Og2r1gEOFqO/c7AeGEBgH7Vi8HaVUfDUt8bCk5t/I7DNhliony+jIeL+
 GoHjoZOD+f4cWJi5wcD69CMKfn0WRuAOrVEQClYhWLXnw4XGThaWR+5gqLfdRXBxdhrDY19s
 2TVwH0GgpZyFudpuDOOhV+HeUoSFQdtpFhZGGyj4y8eCqzzAwHmnFYG5qZ0F+/kOGvx/9HAw
 +mSFgim7lQJPx/sw435Iw3BtIxV7Xyz1QxI4681UrDymwHblBgVRdysHt5umaHCXpoJzZJyB
 P1scHKzM7oJ1VxEMeB5xMP2tjYa2hTtMth2Jzy1naLG18yolWsZWWdH7nReJyy+sSFy8bMai
 pTbW3gxHsFjR+al4eTjMii+WJlgx8MxFi0ONRKwbSRP9jmlOrOj9jcvN+kix94hUoDNJhh37
 Dym0tubUY2H25KWpBq4U+ZkaxPNE2E3KxzbWoDieFlJJVdCHZGaFLWRyMoplThAyiNfs5GqQ
 gsfCtWQy2vUAy+5rwmHSXrFZRqWQSW6Nvy3HVcKXJNLn+ldVCvFk8FyIlhkL28jk2jwlx7GQ
 TJrXeHkcF7u0MneGkTlRSCHBqz9TtUjpeMl2vGQ7/rddCLeiBJ3eVKjRFexJN+ZrS/S6k+mH
 iwo7UOxDuj9fqbuOFsdz+pDAI/UrytyqsFbFaEzGksI+RHisTlBmfhYbKY9oSk5JhqKPDcUF
 krEPJfO0Okn5bp50SCUc1ZyQ8iXpmGT4b0vxcZtKkSQMx4ey2lN+zNqcGRlqPb0n+72pW/2J
 xWQuafmTia3piYO2poPJxyubo13dljfeDGrKh/QT+9LrXw9kzHyP83pRWPB9mLHwjidt0BPd
 kNvWk6ItrlN9sXMj17/Bn5BUme09W7y1J4dqOdv9YP9YnektYpltO8D64xsOMr2myq/UtFGr
 2bUNG4yafwCIKJ+/jAMAAA==
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

On Sat, Oct 04, 2025 at 06:39:43PM +0200, Wolfram Sang wrote:
> On Thu, Oct 02, 2025 at 05:12:35PM +0900, Byungchul Park wrote:
> > Functionally no change.  This patch is a preparation for DEPT(DEPendency
> > Tracker) to track dependencies related to a scheduler API,
> > wait_for_completion().
> >
> > Unfortunately, struct i2c_algo_pca_data has a callback member named
> > wait_for_completion, that is the same as the scheduler API, which makes
> > it hard to change the scheduler API to a macro form because of the
> > ambiguity.
> >
> > Add a postfix _cb to the callback member to remove the ambiguity.
> >
> > Signed-off-by: Byungchul Park <byungchul@sk.com>
> 
> This patch seems reasonable in any case. I'll pick it, so you have one
> dependency less. Good luck with the series!

Thanks, Wolfram Sang!

	Byungchul

> Applied to for-next, thanks!

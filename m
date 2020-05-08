Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AAF1CB279
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 17:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291C16EB1D;
	Fri,  8 May 2020 15:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B286EB1C;
 Fri,  8 May 2020 15:05:22 +0000 (UTC)
Received: from mail-lf1-f48.google.com ([209.85.167.48]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MfL5v-1iw53D39VD-00grpf; Fri, 08 May 2020 17:05:20 +0200
Received: by mail-lf1-f48.google.com with SMTP id h26so1673853lfg.6;
 Fri, 08 May 2020 08:05:20 -0700 (PDT)
X-Gm-Message-State: AOAM532eYzre1U2p1aHukw2TqB9Vrt5/KHH1vL/c7qOIn7jbxqrUQXA/
 TXmjPEkmFmBz4wFKV3K1aJtfVeUJCU/P37Mg18w=
X-Google-Smtp-Source: ABdhPJyBltViryv41vDy3Je/p+d9AY37nsBBCYK0KZkRu7fGETBmMjCRR1El62fP+c+cIE40ko0QZEWIDYVXanRJ3Wk=
X-Received: by 2002:ac2:5df9:: with SMTP id z25mr2260623lfq.125.1588950320229; 
 Fri, 08 May 2020 08:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200508144017.3501418-1-arnd@arndb.de>
 <20200508144017.3501418-2-arnd@arndb.de>
 <20200508150041.GI19158@mellanox.com>
In-Reply-To: <20200508150041.GI19158@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 May 2020 17:05:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1vCx=XibDdoDqG9obpCFx0JCibAvcKFh6E7_NR_hJ03A@mail.gmail.com>
Message-ID: <CAK8P3a1vCx=XibDdoDqG9obpCFx0JCibAvcKFh6E7_NR_hJ03A@mail.gmail.com>
Subject: Re: [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
To: Jason Gunthorpe <jgg@mellanox.com>
X-Provags-ID: V03:K1:97stY4pWi42gp9zHTbDArbzQYiQodfBs5TmAIxUlEZrJTWYBdsO
 PfLBU1RL1cAu4zM5X/Dl1SQNPs6LSCkUb9EmUmPQrPDO496r1pj0sZbyhDM8iiLfOLcAJZW
 0mXbr2aacf9Pq0LwCM0ysylbA6eEWWXncahYkEALhA7i3sMWuOu8p/FOuqo0tcqVz+v9f/D
 pWJDwSAPP+/CTkgk5l3Nw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MSKnLdMqs8g=:hxu7qhdqeIjILOiFqKF1U6
 r6tsTj7JSNNvQuKd2SzH4k3Kc4N1EYnktl8z0JSAzZasl8gSkaUpTL1l0HZtFA+NCwym38Usd
 JjMASFvv+opuwicooS8ulzoW8LaioO5v8t/jkLxWuvgAIdQlUNIOCNVTat4XxH21zGrKrC3py
 4Sv0V1VQbxNPg4FDOPwPzmdgQi1m83CmRCkPXj57Mk09eO0LkZsNnlFVYvxKb1aHQufYdl8Fj
 MlWJW0R288VMdRS2SImkiLq6UwQNWmw5fgEd4URODOezCUUwiiuZ6/E3DbtQgf0yByLlxOFF5
 GeRC95HyCBqtb1oR/FoM3DCf9rUFY7iU1v1GnEbxbl98p2V0M6AIgN0mMSs61n3ru7qRX0sda
 hGFrh7aJ1yCeUgrbFSInIS9SnOC2UoFyKaCzLjYYL6eIrB+L5UGsEQ/1t1MAy3eQvUUQBgJgF
 VLsS5i05H1J7rGCvu0dEc+r8KmQqMQ/QT70FWoXkz41isDaASTyrddCs5gog9AAL0/Gc1Y2yu
 5+Couct3/i05OBKeE01XkKfNZhmqXcT9fu5QocFFfmfQ6MSI9Cd6okUkox2Veg+o/mgiT/5wl
 0pzYSL10zU0VxRlITDXvfIul/jeA7gaH3JRGlFGUN2dkfq2WSSPiI31pozWVXsRkdrP+nO20W
 LXNjTY8rZ/kCa0qmW7ItIRa0RLwPRoX7nbIw1SEqojg94j0uzmgocollGWQp2Jb5vlkzwVkTw
 tfTQtWeh6AUYiikbXsD/EntsmEi3pT3kAdq8aqjEhs2BiQ38OIOBVXdgKw+HA+ZBORwecvNRb
 T09DZ3XQ+vVDp0/LA8n0g6mz8BKbgkrUxlY1koubWER6ayTahA=
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
Cc: David Airlie <airlied@linux.ie>, John Hubbard <jhubbard@nvidia.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 8, 2020 at 5:00 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Fri, May 08, 2020 at 04:40:09PM +0200, Arnd Bergmann wrote:
> > CONFIG_DEVICE_PRIVATE cannot be selected in configurations
> > without ZONE_DEVICE:
>
> It is kind of unfortunate to lift dependencies from DEVICE_PRIVATE
> into the users, is this really how kconfig is supposed to work or is
> something else wrong here?

Usually the problem is trying to use 'select' for something that can
be done with 'depends on'. I have actually no idea what
CONFIG_DEVICE_PRIVATE does, as it lacks a help text
and is a rather generic term.

Would it be possible to decouple DEVICE_PRIVATE from ZONE_DEVICE?
It sounds like the first is related to the device model, while
the second is for memory management, so maybe the dependency
is not necessary.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

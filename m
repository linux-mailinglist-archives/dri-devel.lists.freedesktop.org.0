Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274D4AE5AA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 00:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0196910E34E;
	Tue,  8 Feb 2022 23:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D58A10E34E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 23:53:26 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id i30so1189056pfk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 15:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9yllLJXxvJNbb7TJ6F8GXcTe3gXNYnW6vmBXP6xHdmQ=;
 b=1TP2oV0hvpTVvUc38sU25Nq8P8dLloqnVrR1dLnL0k00RIz6cxvWF4JovZ1JHdh+Iq
 QjJ5AHaidFx9YmqNTrZ5h5qyJPKM/tziAB9DhO4YFzjPd5bpNTRb+YsjUwlfA7jtVsFK
 U7OdrJqAvGZ07hdSarMyxYyjKgkfa4xWh2cbsWw1St7pAb9nNM89cLwW6fNieqLKy8A0
 lEy6S237O1zyS6B6nOobWB1RoW/2FsR/vn8FET1ptCNsh08iwgcstMONTlv3sghEwQq4
 uOxijQbfhnxc35FRPR6EYrfjLYHOlXzLa9Vs6xBYs94IsyLrdPrgdUt8qrZhQDjGtN/K
 zJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9yllLJXxvJNbb7TJ6F8GXcTe3gXNYnW6vmBXP6xHdmQ=;
 b=fPnqa6l2/L8YGIl0kPgMfsen9tpRJKPVGn4n2Y+3qL8IdhG3Q0L/bQUIp5ADTNAqs3
 yYNBN9Hna7/8dPGeEp8ocyAP4MVdWD7jS/Ho2b/ypiXf6YGRBU1x9WLiwurpwtvE9tJ8
 U5DCvlMo7tSclFcShEp/pO6jTfyFp9d60ahW1riKRQeGnClOHk+mNXmbVmQZ3JBNKOP8
 LczE3XwbWP1T6g4D1Rmt1XJ12H5tdoaAKs+Cb0PQDqzf6IEbCYgWudUyQ8yP7ZBLKsBx
 StLDv3Ost7TA9TbKfPofi19aBRz3USWsKHdSA3jvVNQ04pagNE3AdC9FqU1ObqFas1SP
 argQ==
X-Gm-Message-State: AOAM53049q4PQ99aq0+HwxFyA9TkRfGmHauOBdGXWgpOFPNydWi6OXIh
 tsdIgCpqyjlBImZpLHxG2UjPTA1r3p7h45n5TTf9hA==
X-Google-Smtp-Source: ABdhPJxeYY0PWIjCV0oL3qSXzPE/CqXZVnxQ/6hAd62TUxvblfYAlcQYEDEiHEyZHUJKW9dSv16xGL4Nt/VbJK9Vxe0=
X-Received: by 2002:a63:8849:: with SMTP id l70mr2640980pgd.437.1644364405842; 
 Tue, 08 Feb 2022 15:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-7-hch@lst.de>
 <CAPcyv4iYfnJN+5=0Gzw8gKpNCG3PJS1MEZxxoPwuojhU6XHNRA@mail.gmail.com>
In-Reply-To: <CAPcyv4iYfnJN+5=0Gzw8gKpNCG3PJS1MEZxxoPwuojhU6XHNRA@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 8 Feb 2022 15:53:14 -0800
Message-ID: <CAPcyv4jfNa2BBuE7E0+8LO5VT9APS1eF3c4Rw99oKY6y+1re9w@mail.gmail.com>
Subject: Re: [PATCH 6/8] mm: don't include <linux/memremap.h> in <linux/mm.h>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Linux MM <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 7, 2022 at 3:49 PM Dan Williams <dan.j.williams@intel.com> wrot=
e:
>
> On Sun, Feb 6, 2022 at 10:33 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Move the check for the actual pgmap types that need the free at refcoun=
t
> > one behavior into the out of line helper, and thus avoid the need to
> > pull memremap.h into mm.h.
>
> Looks good to me assuming the compile bots agree.
>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Yeah, same as Logan:

mm/memcontrol.c: In function =E2=80=98get_mctgt_type=E2=80=99:
mm/memcontrol.c:5724:29: error: implicit declaration of function
=E2=80=98is_device_private_page=E2=80=99; did you mean
=E2=80=98is_device_private_entry=E2=80=99? [-Werror=3Dimplicit-function-dec=
laration]
 5724 |                         if (is_device_private_page(page))
      |                             ^~~~~~~~~~~~~~~~~~~~~~
      |                             is_device_private_entry

...needs:

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index d1e97a54ae53..0ac7515c85f9 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -62,6 +62,7 @@
 #include <linux/tracehook.h>
 #include <linux/psi.h>
 #include <linux/seq_buf.h>
+#include <linux/memremap.h>
 #include "internal.h"
 #include <net/sock.h>
 #include <net/ip.h>

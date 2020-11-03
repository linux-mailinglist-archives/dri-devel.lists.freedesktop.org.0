Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B62A436F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BC089F77;
	Tue,  3 Nov 2020 10:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36A189F77
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:54:25 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t14so13402477pgg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pr70uaXWQ5V9OEnpZUw1+PkE5bFME26YS/kMKBh3/j4=;
 b=Z1nxH0jDHYEqq8hm0bVNqvQCGIZiEpIpb3zSwcYXQieBLtra1nCwDJgpu5pP89uJzE
 AkhrBgNlD6HCyN456iYZGK8zXMn2VqjNio/0ngfT65e6vFKeH9P/k+YNx0fz0NX90SQM
 JId+N9RTHwMw0LwsVjrJ0K/iWTlm+/5RRX+O/Qjs6Unhw7bP80fuwGuRg+eAD4HDASkn
 xBbZ2MPC8C7aomhpP8xQDtCO64OoJw54a0Ax1nTLubP8Yh2DLws0e+6UO7/9eRpRrt3U
 p4wJZFBQok7bOE/bbaJc+Lng79kYbok1iizF3WW9gFugdQUddODfxMzleDA0d88pCHQj
 0aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pr70uaXWQ5V9OEnpZUw1+PkE5bFME26YS/kMKBh3/j4=;
 b=hPH3hnFISUqWeSqLMFQrkrDbYYHrBQxZbrqVDIfjSuBHSFVYlQxDOMeaEtEsJF9EKE
 8i43JyyYV8mwFDCrYH/Xjbjq4hzE505/rdxm9F8d82agYNExpaUAjOeSu+HmKiuYn+F4
 6nE52STwJCs4J0rkMfyho8KNsZtUPOc1CTte02Vu+LoXhBDZRzpQXTNKKOCbCqKGBoqh
 JKDE3vOK4lqk8qgecvrw/RgqLF277IzxdwdZyIYrfjzEpMbnqxYXF/8wseD5t7aXIGtV
 zroUkVeeOhtR8+/+jtIAU1J5Y8qBzy2Z+yxYUwbs0w9D9Bn2ziBrNnI6Y6+SY5Ir2nq5
 4ayQ==
X-Gm-Message-State: AOAM533lwfSlrXS5X7kdN8ZGtbsvWKRivWqGdFCAM26NhoeqIyPRlOC3
 sWDmb0aqnN5bNQjccWYj4xkRKSOwnAWYBGd62B4=
X-Google-Smtp-Source: ABdhPJzFEjyEEdc+kSmf/T1nHeNhjOJHPnuC+7t9Znx2RJFmaAHHYOf4fCTxwiGuX4v/1cJJtqmJw1ySNSiuUS5bxLE=
X-Received: by 2002:a17:90a:430b:: with SMTP id
 q11mr3222009pjg.129.1604400865170; 
 Tue, 03 Nov 2020 02:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20201102152037.963-1-brgl@bgdev.pl>
 <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
 <CAMRc=Me4-4Cmoq3UdpYEEhERP6fvt97bEJsZYhrcFSQf+a_voA@mail.gmail.com>
In-Reply-To: <CAMRc=Me4-4Cmoq3UdpYEEhERP6fvt97bEJsZYhrcFSQf+a_voA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2020 12:55:14 +0200
Message-ID: <CAHp75VdpriwuktGrMpcXXQuHgfDL6SzqmQTsGFNKLBb=QiKuGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] slab: provide and use krealloc_array()
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-mm <linux-mm@kvack.org>,
 Christoph Lameter <cl@linux.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Joe Perches <joe@perches.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 12:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Nov 3, 2020 at 5:14 AM Joe Perches <joe@perches.com> wrote:
> > On Mon, 2020-11-02 at 16:20 +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

> Yeah so I had this concern for devm_krealloc() and even sent a patch
> that extended it to honor __GFP_ZERO before I noticed that regular
> krealloc() silently ignores __GFP_ZERO. I'm not sure if this is on
> purpose. Maybe we should either make krealloc() honor __GFP_ZERO or
> explicitly state in its documentation that it ignores it?

And my voice here is to ignore for the same reasons: respect
realloc(3) and making common sense with the idea of REallocating
(capital letters on purpose).

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1E1230D5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 16:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064546E18E;
	Tue, 17 Dec 2019 15:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE716E111;
 Tue, 17 Dec 2019 15:49:39 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id s64so5880533pgb.9;
 Tue, 17 Dec 2019 07:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0bppgrIeedrGmyWxXyk9G+dVbYZCgNhYwm2U7ZZ9wCI=;
 b=ZD9Px2deC+SHCKG9ben+v59xHHrWyaFrSLjtTdXYD5Cu8Xp4QbtXWV60beYRhfIxp2
 proVUwu7FUIenM8UkMOb66K3mp5e2IlEjIh3o4UQU/7qLZi964kgmRv7C8Yc7jO/BLAx
 0UC1hce8XrR9qFX8lR4LhjtjQ30PwNQAUIRQfN5eOQ4CB6bHx+5aD2YS9QR4k6UQYNj7
 0fMuf+B/yhF/Yk0m1tvcHlE6eNfRMCsIGiQInA+AXiTmdHKL4JZ+WZ4qAJCuU45+mR7h
 8iJ2j63ebfeMOxN26mqPIRBXcqafsWL3YgTQP8nmoXUMtbNRjX9igbksCTH45EuBkLwd
 oQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bppgrIeedrGmyWxXyk9G+dVbYZCgNhYwm2U7ZZ9wCI=;
 b=R0UfBFDhVW19Yu9YnPR7bJFxzdmChjNAiqKXbtUUf8CQJIasLyQ/yfRDxpxND8VJQZ
 FZ22xbmkdGiNB+4nU3FvcvtlOLeGt3+lf4svg3LtV9jBpXqLOXiTxydBNKArwyeTS9Qj
 MQlhcltOxxFS7WOJh6SJtE05ieeoeuVo14z0NAl21+WMc1SbtBl8NFPyRQ0o8KKvPrJK
 9Rji9dChj+kCVHrgB4OqT6PXHKi9qHK1wZ46RIujAxwvJi0VaMr/1yPC0yP220BTPTrF
 KU1dglbXVcHZYuV2j/sWWM3KHt/Ra+9dTrBSYbnuGBfx1MMCUKQahfXNVeM5QVzwUL8w
 6Obg==
X-Gm-Message-State: APjAAAXwTyRGc0Y+43uiursm23YstRqjD/ym2l0hDEXgjSRMWbzRboQ8
 OEHs+blvtQ20VHl0LyUAfvY1d01nl7RGNvu3gPA=
X-Google-Smtp-Source: APXvYqxhFVyocJZP/Fex0nME1DxI3VWvcXcmcx2qeijL59/bQ3PzHYDrqfQ8F28lrvEGowIJEQutCUYuXH5Nq9a2Pxc=
X-Received: by 2002:a62:1a09:: with SMTP id a9mr23011227pfa.64.1576597778583; 
 Tue, 17 Dec 2019 07:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20191216162209.5b5256dd@canb.auug.org.au>
 <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
 <20191217054255.GA26868@ravnborg.org>
 <65c9dc7b-3c61-8204-07da-212632732791@infradead.org>
 <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com>
 <CAHp75VfmGo1LzsHiq_UvWbhvRGovtaLVnRPZJ=40arrJWq6HvA@mail.gmail.com>
 <87d0cnynst.fsf@intel.com>
In-Reply-To: <87d0cnynst.fsf@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Dec 2019 17:49:28 +0200
Message-ID: <CAHp75Vd28j5_xexHyXacRaSv=VRkmBLrSh=w2FE8nmAGWdAo6A@mail.gmail.com>
Subject: Re: [Intel-gfx] linux-next: Tree for Dec 16 (drm_panel & intel_panel)
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 5:28 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 17 Dec 2019, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Dec 17, 2019 at 1:56 PM Steven Price <steven.price@arm.com> wrote:

> > I think the proper one is to have s/IS_ENABLED/IS_REACHABLE/.
> > It fixes issue for me.
>
> As discussed off-line, this will allow silently building and linking a
> configuration that's actually broken. (No backlight support despite
> expectations.)

In my case I have deliberately compile backlight as a module to be
used exclusively with backlight-gpio which has nothing to do with
i915. I dunno if backlight is a MUST dependency for i915.

From my perspective the original commit, with all good that it
provides, should not break previously working configurations. Though
we might argue if my "working" kernel configuration had been broken in
the first place...

Just my 2 cents, though.

> IMO deep down the problem is that we "select" BACKLIGHT_CLASS_DEVICE all
> over the place, while we should "depends on" it. Everything else is just
> duct tape that allows configurations where built-in code calls backlight
> symbols in modules. It used to be more about an interaction with ACPI,
> now we've added DRM_PANEL to the mix.
>
> I've proposed a fix five years ago [1]. That's what it takes to fix
> these recurring failures for good. I'm not really all that interested in
> the whack-a-mole with the hacks.

Agree with this. The root cause must be fixed once and for all.
I guess it should be a logical continuation of Sam's series.

> [1] http://lore.kernel.org/r/1413580403-16225-1-git-send-email-jani.nikula@intel.com

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

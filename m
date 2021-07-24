Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBAC3D49CC
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 22:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB22F6E12D;
	Sat, 24 Jul 2021 20:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471B06E12D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 20:21:41 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so8731241pjd.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CaGEdpDA93dZP0T/+1LD+f5/OqGOURSdBO4AdBPyvbk=;
 b=AI4mpHFjoc+Y2m9BVS+3RhJtiRCm72bWPg5xeFX3yUwqR9Kdvzh37YFqhkJlkxPQt7
 kgl/LMUCRXv8Cpzf/xkr1Mk29l5n/cBKw8q/Pzzs17W0xS8iRR0G/dA4p2WktS3yTBD5
 vkvSfAvXlt7/VtugQrsqlNR7rSq+e/qVLW61GE+/jOBJCTfHwLRuuX6u0aRQ960n8uab
 2P+UTPnucB2iQqQRZ/IIdNbmc/T7yfMNUddULY9b7pa3CzHYN5sitUrElKRkuglqSVqd
 hD04yQtRjEzvbJneJ2RZwezrBm7zI8/YRhcxZRGfhuKJax+aTmEryBLZPU1NqIUQicG6
 qFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CaGEdpDA93dZP0T/+1LD+f5/OqGOURSdBO4AdBPyvbk=;
 b=sd9Dx1E3yjJSU2GuvZpAs0GENfjOMI5uPd0YTxc2F9AwmehOlqPocbR/Y7NMJBVaeZ
 ZhuDtdzWSdHRtptQwYd4fVGYcxlmsLjks22hST4wYFmXl/2J2VYN8WFgntAkPPwUlo8D
 qojwCyHYgtrc23ffJffRfHeWZGOmgb1GxBnGJ1MuOT/AXwxdLZd/OBizTTd3719s9c85
 AMSUCk7+/UlGQiAIdALeIJOWDmOzGtajbS+n2RZ+ks23JCoH3WsiEv03TKMRreegT1fi
 TQ3vxBNo3KhQp9l/0U0bwtxiNVR/IzukZm18YQnplL/Vtzq272tbKhCB+nVEAkmxs/KS
 S1DQ==
X-Gm-Message-State: AOAM53110tWlithQ62PqgZecfpMUpdio6szVqWZX18mgixoPeCC2jlud
 NdtJZLCHBsscEEslkpj22mxahb6EmQdy16eYYFc=
X-Google-Smtp-Source: ABdhPJxIurtl+fyEVAfteEQTQRQm0hJYAmrkxEIc3ejHJa8Sxk7bXTxc+lF8kHpmsI9dOr0LIZjXQdwtFgfOfFRHTCw=
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr11150254pgg.4.1627158100931; 
 Sat, 24 Jul 2021 13:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210724151411.9531-1-len.baker@gmx.com>
 <20210724151411.9531-2-len.baker@gmx.com>
In-Reply-To: <20210724151411.9531-2-len.baker@gmx.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 24 Jul 2021 23:21:04 +0300
Message-ID: <CAHp75Vd+ZM_yO6CU_6oJieePMt00Sp6oKEU2+QEyZxLDg5PN8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging/fbtft: Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Phil Reid <preid@electromag.com.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 7:05 PM Len Baker <len.baker@gmx.com> wrote:
>
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy() but in
> this case it is simpler to use the "%*ph" format specifier.

...

> -       char msg[128];

128 / 4 = 32. So, this buffer is enough to debug print only up to 32
bytes. Hence %*ph replacement won't cut output earlier than requested.

...

> +                       for (j = i + 1; par->init_sequence[j] >= 0; j++);

Why is i + 1 initial for the j? You may rather access the 'i + 1 +
j'th element in the array...

...

> +                                     par->init_sequence[i], j - i - 1,

...and get rid of the ' - i -1' part here.


-- 
With Best Regards,
Andy Shevchenko

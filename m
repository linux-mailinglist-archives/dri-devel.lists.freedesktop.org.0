Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C953140B2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA56E9F3;
	Mon,  8 Feb 2021 20:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7E6E9F3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:43:47 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id z6so1351505pfq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 12:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=obDV9I3X9Q9ETr/d7/JJJtO01x++Iqx0cP/5PJD8kOk=;
 b=krXYUzcpYuvD1i4Y1QB/c/ebFNqSUJQasnj0UlR4ZOJhwuTXeBM4WQqNK1QfLdmYdl
 sanEroE1KhDL8GhqPd5nsfpXjukIJgbZyZ18x0+xK3xTKwOlziFm04okzHYWrcpQ5Mfj
 iQU7Ke85+pcGCCZSAeZ/5cfchfsXB0lq4/T1iO/ayC9qoGkHn4e29QPdhHYFweU3gXB6
 MrDyZ6A+lPDNXs/sKni/w8Z/xtOsbB+YiRdKxgOH4vGvNLq4joNr+xuNsj4ac/UFijfa
 mqafLQDRU7gqNmKtFFGCBk6dArQgWaMNN5FXS0ufyMgs+IvsPEG8dPpBBozPNF10I0Rn
 CEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=obDV9I3X9Q9ETr/d7/JJJtO01x++Iqx0cP/5PJD8kOk=;
 b=MZmDofRwTfUjbnWP8k+Xcs1DqIE081grSj+rljx8h9EPFNRmk5HisUTKk3DbSicOYB
 cgJguXYFxWmQ0mlkXtrMtJHF9zImQihV/gxIwpTuccjbQTXIQ0h+ogKIq86kQzvfFaae
 3QzoM0/g8eNCJicKwLRd7BQpvXdho2ZPlXx2gB0ERtBC0+arePw6w1Ba4Lzw1dFl4yy2
 JXDPULfGxEo1Fux21bYxaoSLTpOpNZqTPo3c7FwkTLai/vK4Zi+unAdQzO3kFJjnxNTe
 DUXnAeeIcpRE6aVZkrSU089ldQ3tuL4jrEaqxSP4yYqLbnO9Kgr02WEIopqllp8AxCtx
 9ClA==
X-Gm-Message-State: AOAM532xU8jmr+SsJV2tXtFhmTAAf96LZwzkrH96FWrhYsGIhIffuVSj
 evElmuaQ4S3dgpFZOyBpnYR4V9H2UusWh7JIGfc=
X-Google-Smtp-Source: ABdhPJzAaCj3xJyegMBtVD1UqGu/aOrXEVvKz91WjdC0gh3MwYnVNuYrDZ7UPAwQqWbt56zsMOdVKOXqiJXSEcvj7yw=
X-Received: by 2002:a63:3d0:: with SMTP id 199mr15739479pgd.4.1612817026721;
 Mon, 08 Feb 2021 12:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20210208200903.28084-2-sakari.ailus@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Feb 2021 22:43:30 +0200
Message-ID: <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.

Thank you for an update with the examples how current users will be
converted. Below review is based on the users I had seen so far and
assumptions made in this code. I see that it's tagged by maintainers,
but I can't help to comment again on this. In any case the decision is
up to them.

...

> +V4L2 and DRM FourCC code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +       %p4cc
> +
> +Print a FourCC code used by V4L2 or DRM, including format endianness and
> +its numerical value as hexadecimal.
> +
> +Passed by reference.
> +
> +Examples::
> +
> +       %p4cc   BG12 little-endian (0x32314742)

This misses examples of the (strange) escaping cases and wiped
whitespaces to make sure everybody understands that 'D 12' will be the
same as 'D1 2' (side note: which I disagree on, perhaps something
should be added into documentation why).

...

> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +                   struct printf_spec spec, const char *fmt)
> +{

> +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];

Do we have any evidence / document / standard that the above format is
what people would find good? From existing practices (I consider other
printings elsewhere and users in this series) I find '(xx)' form for
hex numbers is weird. The standard practice is to use \xHH (without
parentheses).

> +       char *p = output;
> +       unsigned int i;
> +       u32 val;
> +
> +       if (fmt[1] != 'c' || fmt[2] != 'c')
> +               return error_string(buf, end, "(%p4?)", spec);
> +
> +       if (check_pointer(&buf, end, fourcc, spec))
> +               return buf;
> +
> +       val = *fourcc & ~BIT(31);
> +
> +       for (i = 0; i < sizeof(*fourcc); i++) {
> +               unsigned char c = val >> (i * 8);

...

> +               /* Weed out spaces */
> +               if (c == ' ')
> +                       continue;

None of the existing users does that. Why?

> +               /* Print non-control ASCII characters as-is */
> +               if (isascii(c) && isprint(c)) {
> +                       *p++ = c;
> +                       continue;
> +               }
> +
> +               *p++ = '(';
> +               p = hex_byte_pack(p, c);
> +               *p++ = ')';
> +       }
> +
> +       strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> +       p += strlen(p);
> +
> +       *p++ = ' ';
> +       *p++ = '(';

> +       p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> +                              sizeof(u32));

This is perfectly one line (in this file we have even longer lines).

> +       *p++ = ')';
> +       *p = '\0';
> +
> +       return string(buf, end, output, spec);
> +}

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

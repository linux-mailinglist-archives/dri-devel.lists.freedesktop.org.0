Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9FB4B4525
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD6D10E238;
	Mon, 14 Feb 2022 09:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C083610E238
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:05:27 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id g21so5240816vsp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACc7MhlmQaRHyX1iGzVS1S3D+ci69MdBwNfaRqsmbHE=;
 b=5/hEOj5ThpVWz6Kw8+Ab59I9mz9I/iG1gExk7gCZxAVlT41Xi0gxyGiT8zij2NG1Gy
 YHkN37/FmKtqfHT5/SuFYZNRb+sPGmVcais8ka3N9K0If1LllvvXBUyMYc6iFuDhiEnE
 RgTOv2nXi66CThFbybsRafInvcZ9kT1oDS8+mlkGKx8/56U/UvyYg3FpMW+i6QFnJa95
 y7A50F1Rc8b+L7mita5yne8DLSGMu02MtFI4sJNZoZlh7qjw0yohZScl2iErwA6Pl4xh
 HnljFAUnRYRSFw98mm4yhy3jIFH2u9IkoeXy+oXwZYj9IczrEh5RRc2CheDN6I3Z0iOC
 RIxw==
X-Gm-Message-State: AOAM530sdXFI6FkFxjO+F9l2LeuRoRCd2gxZVD0EZ0fZx8Eh3YIp4w3A
 Z8r8JqXgq45bxqsGazf/rCXAeoP308LljA==
X-Google-Smtp-Source: ABdhPJzXwaifz9+WKsVp1OD2rwlQyzj9Z7E0wc9XTEiKflYpO3cmMi90B9wc4Y9aC0kqT4pmgCULKw==
X-Received: by 2002:a05:6102:548a:: with SMTP id
 bk10mr3688199vsb.27.1644829526643; 
 Mon, 14 Feb 2022 01:05:26 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id v30sm1231614vsi.19.2022.02.14.01.05.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 01:05:26 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id u10so4998276vsu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:05:26 -0800 (PST)
X-Received: by 2002:a05:6102:440d:: with SMTP id
 df13mr936716vsb.5.1644829525839; 
 Mon, 14 Feb 2022 01:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de>
 <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
 <9b2e2649-1511-66a3-b346-60863de788fc@suse.de>
In-Reply-To: <9b2e2649-1511-66a3-b346-60863de788fc@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 10:05:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPw8UcTVown3Zghxn11-WuqSBNCWKpP3T5NUxxZmntcA@mail.gmail.com>
Message-ID: <CAMuHMdWPw8UcTVown3Zghxn11-WuqSBNCWKpP3T5NUxxZmntcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev,
 bernie@plugable.com, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 noralf@tronnes.org, andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Feb 14, 2022 at 9:28 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 14.02.22 um 09:05 schrieb Geert Uytterhoeven:
> > On Thu, Feb 10, 2022 at 4:24 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Fbdev's deferred I/O sorts all dirty pages by default, which incurs a
> >> significant overhead. Make the sorting step optional and update the few
> >> drivers that require it. Use a FIFO list by default.
> >>
> >> Sorting pages by memory offset for deferred I/O performs an implicit
> >> bubble-sort step on the list of dirty pages. The algorithm goes through
> >> the list of dirty pages and inserts each new page according to its
> >> index field. Even worse, list traversal always starts at the first
> >> entry. As video memory is most likely updated scanline by scanline, the
> >> algorithm traverses through the complete list for each updated page.
> >>
> >> For example, with 1024x768x32bpp a page covers exactly one scanline.
> >> Writing a single screen update from top to bottom requires updating
> >> 768 pages. With an average list length of 384 entries, a screen update
> >> creates (768 * 384 =) 294912 compare operation.
> >
> > What about using folios?
> > If consecutive pages are merged into a single entry, there's much less
> > (or nothing in the example above) to sort.
>
> How would the code know that? Calls to page_mkwrite happen
> pagefault-by-pagefault in any order AFAICT.

fb_deferred_io_mkwrite() would still be called for a page, but an
adjacent page can be merged with an existing entry while adding it
to the list.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

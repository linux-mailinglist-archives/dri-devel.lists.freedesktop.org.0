Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F155EBE2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74211210A;
	Tue, 28 Jun 2022 18:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E771128AC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 18:05:55 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d17so12685613pfq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pTcGgtfSu6n7KkCWKQ4ciWe5XeKK5S4riO8KfNVW7Ig=;
 b=F/CZTCTDOlhkWqZ+vOzW0DaoZ/EZ1dOhoCSSJ2RrwBNwuY7CCyvEtaLLk8DO+FYVI8
 oY1bh2Rw2NH/e7uwuajkABgxQQynq/vb9wDrQT1ziurYSmeBDoqa9s9XGmGLyXXXVu1m
 Ptj/OKkdrLcBprdD9gQ9RffSNU26yKh9HCJiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pTcGgtfSu6n7KkCWKQ4ciWe5XeKK5S4riO8KfNVW7Ig=;
 b=757np1jOOY+ZxJyIt9Beee897mgCzkm8KZDfFu5i+klMrvtaH2OSgiRIh4lMulkKpE
 SrDaJbrgOsIy/yQAhi9Y7wsJVL1nZBkhcNHxjObZdee2czCzXxege01N1ELT3y27EEQH
 e4CgyX5lnLQcSHJ0zTDWgkxvf9PqDGYXztPlG50H5QXucJOCv1UCaHJW+wkFHsOVIZiD
 A0J5K9Ke4O3n0c2GkmaHzOLTgouWr5Ol/NqisIg3qrjuPHF43O+17emDz+8zGVNUnKY3
 DFmmOrMuFiyplp/ilIwK9jgGNVI6pp0/KNvnXvj+XiMrsHpSJDmUq74ItjyLI4rGPpnf
 oeUw==
X-Gm-Message-State: AJIora/O/kvKmNsZp38veCy/VzXRm/tE3UJdq6VUqdOkQKWDk3DZrHd6
 zUA+L2zFKDow1UenUFDTgTvzkA==
X-Google-Smtp-Source: AGRyM1v6cdnwBfGpeB2JnkCbahQ14YUYaqjRd3VUKbR8YPBigZjfWVkzlvmFIFzfbBj+r2XqbA+86w==
X-Received: by 2002:a63:7412:0:b0:40c:fa27:9d07 with SMTP id
 p18-20020a637412000000b0040cfa279d07mr18441815pgc.27.1656439554674; 
 Tue, 28 Jun 2022 11:05:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a170902cf0300b0016a0ac06424sm9669985plg.51.2022.06.28.11.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:05:54 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:05:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <202206281104.7CC3935@keescook>
References: <20220627180432.GA136081@embeddedor>
 <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
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
Cc: nvdimm@lists.linux.dev,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, KVM list <kvm@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 dm-devel@redhat.com, target-devel <target-devel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-hardening@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 NetFilter <netfilter-devel@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 09:27:21AM +0200, Geert Uytterhoeven wrote:
> Hi Gustavo,
> 
> Thanks for your patch!
> 
> On Mon, Jun 27, 2022 at 8:04 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> > There is a regular need in the kernel to provide a way to declare
> > having a dynamically sized set of trailing elements in a structure.
> > Kernel code should always use “flexible array members”[1] for these
> > cases. The older style of one-element or zero-length arrays should
> > no longer be used[2].
> 
> These rules apply to the kernel, but uapi is not considered part of the
> kernel, so different rules apply.  Uapi header files should work with
> whatever compiler that can be used for compiling userspace.

Right, userspace isn't bound by these rules, but the kernel ends up
consuming these structures, so we need to fix them. The [0] -> []
changes (when they are not erroneously being used within other
structures) is valid for all compilers. Flexible arrays are C99; it's
been 23 years. :)

But, yes, where we DO break stuff we need to workaround it, etc.

-- 
Kees Cook

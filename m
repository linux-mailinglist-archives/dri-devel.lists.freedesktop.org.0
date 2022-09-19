Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5FE5BC3CC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 09:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D82A10E563;
	Mon, 19 Sep 2022 07:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E03110E584
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 07:58:15 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id q11so16933380qkc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 00:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=KKxwW22QapRcZpKvTVaesc2qXSXnP+OfFDAXgdUxUEQ=;
 b=K670ErgbZUwfeuaM8L8Y9y0A4XGXU8Sl+q8LGfSkPIgpy8mw8Lk4IngrhJiEg0ttap
 pdkNIUK9AF4NsS8p7+h6MKq8EUkvQ4nCtiPazKsxfmGbTSDm05lUuW9RM1sz2Y5YC3rE
 H2tAlunhCyMV/p+PDgzfU4T5kI2X4xJAcqnXKpD9YYQWisiSOKryw8vQ3BpfHx+VERI/
 RPXSlltWqQqna2YynjWrKoUBBB2Y4U2zoazNz3DsTlZmadCSxNeitdngORuIhssLrFFF
 cU/gHV/1rBRMnb5U5kckakzBSHQCzo6gyNfWq5TLGl4X2Jb35ePLh37nUdtgm3844JPW
 X5QQ==
X-Gm-Message-State: ACrzQf0uttbdw3dPtZBIq7Yiax27ROkBNJMm5YjoN6f2m6A9GTcSpOS8
 mVskNHiBO5DGzS7Ykk0NGX1g+TIAUqfTVg==
X-Google-Smtp-Source: AMsMyM52otBAwWi3l5ikXLN3EMp7P2/XEFE2V+I1H5JTSxko9psdnaRWbuuf3JMRdk3PP0/XqCgW0A==
X-Received: by 2002:a05:620a:4089:b0:6ce:29eb:9692 with SMTP id
 f9-20020a05620a408900b006ce29eb9692mr12137206qko.273.1663574293841; 
 Mon, 19 Sep 2022 00:58:13 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 y4-20020a379604000000b006bbe6e89bdcsm11497734qkd.31.2022.09.19.00.58.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 00:58:13 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id y82so41349263yby.6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 00:58:13 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr12533972ybl.604.1663574293041; Mon, 19
 Sep 2022 00:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220919105839.496f1b72@canb.auug.org.au>
In-Reply-To: <20220919105839.496f1b72@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Sep 2022 09:58:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQmG6hjyw0g8L2AAuUSoQ9xH=C9zrV=QUoVWp_HM62BQ@mail.gmail.com>
Message-ID: <CAMuHMdVQmG6hjyw0g8L2AAuUSoQ9xH=C9zrV=QUoVWp_HM62BQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Mon, Sep 19, 2022 at 3:07 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
>
> between commit:
>
>   41012d715d5d ("drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage")
>
> from Linus' tree and commit:
>
>   a0f7e7f759cf ("drm/amd/display: fix i386 frame size warning")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index 1cb858dd6ea0,b7fa003ffe06..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@@ -6610,66 -6497,11 +6497,11 @@@ static double CalculateUrgentLatency
>         return ret;
>   }
>
>  -static void UseMinimumDCFCLK(
>  +static noinline_for_stack void UseMinimumDCFCLK(

While this looks like the correct merge resolution, it does mean that
both stack size mitigations are now applied, and probably one of them
can be dropped?

>                 struct display_mode_lib *mode_lib,
> -               int MaxInterDCNTileRepeaters,
> +               struct vba_vars_st *v,
>                 int MaxPrefetchMode,
> -               double FinalDRAMClockChangeLatency,
> -               double SREnterPlusExitTime,
> -               int ReturnBusWidth,
> -               int RoundTripPingLatencyCycles,
> -               int ReorderingBytes,
> -               int PixelChunkSizeInKByte,
> -               int MetaChunkSize,
> -               bool GPUVMEnable,
> -               int GPUVMMaxPageTableLevels,
> -               bool HostVMEnable,
> -               int NumberOfActivePlanes,
> -               double HostVMMinPageSize,
> -               int HostVMMaxNonCachedPageTableLevels,
> -               bool DynamicMetadataVMEnabled,
> -               enum immediate_flip_requirement ImmediateFlipRequirement,
> -               bool ProgressiveToInterlaceUnitInOPP,
> -               double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
> -               double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
> -               double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
> -               double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
> -               int VTotal[],
> -               int VActive[],
> -               int DynamicMetadataTransmittedBytes[],
> -               int DynamicMetadataLinesBeforeActiveRequired[],
> -               bool Interlace[],
> -               double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
> -               double RequiredDISPCLK[][2],
> -               double UrgLatency[],
> -               unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
> -               double ProjectedDCFCLKDeepSleep[][2],
> -               double MaximumVStartup[][2][DC__NUM_DPP__MAX],
> -               double TotalVActivePixelBandwidth[][2],
> -               double TotalVActiveCursorBandwidth[][2],
> -               double TotalMetaRowBandwidth[][2],
> -               double TotalDPTERowBandwidth[][2],
> -               unsigned int TotalNumberOfActiveDPP[][2],
> -               unsigned int TotalNumberOfDCCActiveDPP[][2],
> -               int dpte_group_bytes[],
> -               double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
> -               double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
> -               unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
> -               unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
> -               int BytePerPixelY[],
> -               int BytePerPixelC[],
> -               int HTotal[],
> -               double PixelClock[],
> -               double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
> -               double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
> -               double MetaRowBytes[][2][DC__NUM_DPP__MAX],
> -               bool DynamicMetadataEnable[],
> -               double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
> -               double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
> -               double ReadBandwidthLuma[],
> -               double ReadBandwidthChroma[],
> -               double DCFCLKPerState[],
> -               double DCFCLKState[][2])
> +               int ReorderingBytes)
>   {
>         double   NormalEfficiency = 0;
>         double   PTEEfficiency = 0;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

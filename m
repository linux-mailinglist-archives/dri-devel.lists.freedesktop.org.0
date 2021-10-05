Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B531421BAD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 03:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D156EB0E;
	Tue,  5 Oct 2021 01:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3186EB0E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 01:17:52 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t189so24061412oie.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 18:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DyHwOCOA8BVm3fIYmBKTBAquJnq6mmMC7RLAt62EphM=;
 b=j+McTh5xfKHvrsJdmlG/yhTupZ+rcdzKeHReBzcH/jlLl72oa1rOvM00PCQWPaVdYC
 22ECc8DMmYf7ZlrCGWGnmIpgW32iKqfbiL6qfO36V02wstCKYAEyFe1ZgDvVxkYOA9ZX
 Y2m+6bhS0klquWQRUC50h15O86r7fipHYxmrJP/7mT6Lz7/IolgDCX9jTX10842uDgPQ
 QJutAmWSRoZ6Zjgx4NT0hmZxnR73+PqKgIgcw/u6yMe5yKz5zbRDVLI19bItUwCBptBn
 iHKEiHYMPd6EyUaoDDEa9gPiB3dKx96Nh7ue9kGfvDGRuvz2X5wWQTCYXsRAWgdpayHa
 +VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DyHwOCOA8BVm3fIYmBKTBAquJnq6mmMC7RLAt62EphM=;
 b=0OWpmikNkUXcscVJzJA3kyvJGRT+71GWRWMc5KH4VkJh144D+CX1PWkYQq68v9md6b
 okP89fFO0AfEfjsywy72x/fP4d6mt/jKpF8mjPTnrrZtYxMOd5Fsxdozugicpggpu/f7
 B3eGOuRQnkmeqZVjFPqKG7n61lvggAcAXTeMtE3n3ud5+mdfCC4qf6VhvJpDejsMuFH5
 0L/LVzxvWhbVoiHkhtmsD4Xo3wg/Vp4Q9SjN9NNEfWt8QYWqjskrDtj+GbI0L7AMb6CN
 9QSx+Puvr/9A4aG3QPGWaaoSS1ixvw+BI0NPTB5hxQfTxWLSsytr/yt7FOSBv9G3fnpI
 RhBA==
X-Gm-Message-State: AOAM533g2baIjxO5AIEf/lgwuCDrSbDLEdPLIK9+U9ecZbOzReYw0EtO
 5DgOGXz/9WAWzoLGO+8X/qlJvA==
X-Google-Smtp-Source: ABdhPJwmQ7OVkAOxHeWgbzi4LvP7Fh8PsrcgGBo70cF0RyffToZ8fe55VvlWng17Yi5qBj2+JaHZIw==
X-Received: by 2002:a05:6808:2128:: with SMTP id
 r40mr279140oiw.24.1633396671777; 
 Mon, 04 Oct 2021 18:17:51 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z10sm3263522otq.64.2021.10.04.18.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 18:17:51 -0700 (PDT)
Date: Mon, 4 Oct 2021 18:19:34 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/msm/dp: Refactor ioremap wrapper
Message-ID: <YVuoJgquTnCYviRo@ripper>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-4-bjorn.andersson@linaro.org>
 <CAE-0n52bY27rZzarqrgjh37W3SsyvKTH70H++SmqoZOyETZKPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52bY27rZzarqrgjh37W3SsyvKTH70H++SmqoZOyETZKPw@mail.gmail.com>
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

On Mon 04 Oct 18:04 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-01 10:43:58)
> > In order to deal with multiple memory ranges in the following commit
> > change the ioremap wrapper to not poke directly into the dss_io_data
> > struct.
> >
> > While at it, devm_ioremap_resource() already prints useful error
> > messages on failure, so omit the unnecessary prints from the caller.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> I realize this will cause some prints when we use old DTs. I suppose
> that's OK though because we'll have more incentive to update existing
> DT.

The use of the current binding is fairly limited, so I think that makes
sense. Abhinav also requested earlier that we do that and drop the
fallback sooner rather than later, which I would like to see as well.

Thanks,
Bjorn

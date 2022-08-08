Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB558CACB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 16:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC198FB11;
	Mon,  8 Aug 2022 14:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009C997538
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 14:49:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o22so11607020edc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sGGMDrvq70fK3xNBUxx3zSxTGxbNUsun6AK0mtlXrck=;
 b=aNeNHYUnGAERLnnsoWYIWNZLsBb+XskAb+Zbzep5u56gCqHprwCZpAhjmoxi0eGCt3
 ENCGw+eikSwJrImaEpmJpnt4dXgTf5WdEsQDkixIVfLWK3xndLG9hJyfN5tlBSXsjS8b
 iSl4IzQlwipS4OiUW+qYCtv4IWP6ti/mpxM7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sGGMDrvq70fK3xNBUxx3zSxTGxbNUsun6AK0mtlXrck=;
 b=T0CVylnqkKgaVr5NvHDTJDW481RAhF10NVmz4tLv5LeriP6MM5q/qUTHXFLvetgRWk
 98zyPGDWNy2bHTpfhPExyCX70rw/BwfUBEWl2Vj8XhEW7lA8mR62gDaNTpB2kOCvQMIs
 qleroJ3gMTVXaCqLnXklSKvbsbqFgZrEjLF8d2V8uQ+iVK/TiBnGGdpKp+fDxMH+zndn
 U+7dgAu+MyWFnou5xxy8D1nV53AFc3gV61mertGkcTnalRfA7zIqtq6w/cJEtURNEXcT
 UsNNGkr5shCa5c0RlSofXbOOgUjvvlIe68PTKwPSAQ+5VHAgnYA37jKn4IA8pPbdmOnP
 0CSw==
X-Gm-Message-State: ACgBeo2O/JFXIwDg8l4FFJfD9enSrwHCt2xOFeZgOkQMjLOunGc4xci1
 XCCByw1fVIampFUAAWj/Z0YWpXDs5OKVSO3A
X-Google-Smtp-Source: AA6agR4cvqVby8i0fQSJX/B2AMjNN8FiCQs5wM6tQ1I/0BjTBQkWKkf42ZABaK0BYonOtVCPaTVViw==
X-Received: by 2002:a05:6402:42c3:b0:43d:682f:c0ca with SMTP id
 i3-20020a05640242c300b0043d682fc0camr18036140edc.334.1659970155317; 
 Mon, 08 Aug 2022 07:49:15 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 bu23-20020a170906a15700b00722bc0aa9e3sm4934088ejb.162.2022.08.08.07.49.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 07:49:14 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id z16so11114606wrh.12
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 07:49:13 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr11636287wrr.583.1659970153270; Mon, 08
 Aug 2022 07:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJpoAN4CVMKNouh3pPtX-5rnBeL3_T60M5cNhirNEmNeEkQ@mail.gmail.com>
 <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Aug 2022 07:49:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4cddyPxg2D5KP9ew2i=AQOSn=Jz_OmuZ0BrZCu2+MLA@mail.gmail.com>
Message-ID: <CAD=FV=U4cddyPxg2D5KP9ew2i=AQOSn=Jz_OmuZ0BrZCu2+MLA@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for
 dspp in sc7280
To: Kalyan Thota <kalyant@qti.qualcomm.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 8, 2022 at 3:44 AM Kalyan Thota <kalyant@qti.qualcomm.com> wrote:
>
> >I'd like to land at least patches 6-8 from [1] next cycle. They clean up the CTL
> >interface. Could you please rebase your patch on top of them?
> >
>
> Sure I'll wait for the series to rebase. @Doug can you comment if this is okay and this patch is not needed immediately ?
>
> >[1] https://patchwork.freedesktop.org/series/99909/

I don't personally see a problem basing them atop a cleanup. If the
patches Dmitry points at are targeted for the next cycle then that
seems like a pretty reasonable timeframe to me.

-Doug

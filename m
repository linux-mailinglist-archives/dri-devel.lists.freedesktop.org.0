Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A444375B1F6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E5E10E148;
	Thu, 20 Jul 2023 15:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83710E148
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:03:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-314172bac25so731127f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689865431; x=1690470231; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yk0+OfIBVrjxdxyJzd6k7bKe62s4LYJUT+/V2wesyK4=;
 b=HvrixRAIL67I2qRJlTd4cc4z9glJkuSXOv1aDPxuTIHyLZ5BSGbNepxqA3n9t43KgE
 LBNT82RTszenAssbCx8M1uPIjpd0Ga+VOzLnq6OyFtAzpVQFfyqIHXafX3CHjQQEd+NS
 VWcHimCa5DPA9BQDKkPGcgLs1H3rql+tVoNrRRc5mvp+uIQi1VNB+fldBjbuDabP6L+Y
 8dYfAF9ew641dJCCXIANGFdLugHY2oxVXI2bFgK7ZyX3PbaFwNVP35RxC7uFNQ9jBQt1
 UR5uKK+kQodIL8dGRKlnO40omGFnZ3LRz/tJ6pX+75Kh1+xxemuvvap0HTtLYhqILSpR
 v0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689865431; x=1690470231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yk0+OfIBVrjxdxyJzd6k7bKe62s4LYJUT+/V2wesyK4=;
 b=Hu7Iw0/1fT052T+2jAwqzLrn6PKeDHgPPdD9i1MbIVhBNA8qurg0BWtbWdtPvDsnk4
 mWrXWoLU8rPxuETuqb2w0jrzeNoRLi8y6VdM3u+ejVxlF86Hkm5m7B1tDZGP+rZrSvfV
 RAXlXEeT/6c7J37/8KacjyWon+EmDXvLWgeEo/fFVJ/4KkUs6yffPE5BB39MuzvIBedr
 a0vfWXYfMGxHliIRo0cXtIY9g/br2Q2iooIJmjTmUvq0hVCNieWgYnoK72fVzANJLVOn
 jUFenHCCKXVrkomI8hUmtLPcHiHMdrHmFg7CNT6CqSYXxkP+/fStzg643CA3FQHIXpQs
 mjig==
X-Gm-Message-State: ABy/qLa4TRMSMQ3sduDPZoFEG4HPP8hIk+RXLbDRLTTp4ElhyTYBJTVw
 Vl0H/KG9YoECsGWNTMLtbEklIA==
X-Google-Smtp-Source: APBJJlEnxpnc6Eg6VtavPczW2DTVI9oBNtJTq6mn0UUWeRqPv/nKBvuumDIPWZPdrtpXnWvrphAq/Q==
X-Received: by 2002:a5d:4c4b:0:b0:314:1f1e:3a85 with SMTP id
 n11-20020a5d4c4b000000b003141f1e3a85mr2051958wrt.61.1689865430880; 
 Thu, 20 Jul 2023 08:03:50 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d6b8c000000b003143c6e09ccsm1589783wrx.16.2023.07.20.08.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 08:03:50 -0700 (PDT)
Message-ID: <a3502c0b-d0e8-9166-b6b4-8f40650636c7@baylibre.com>
Date: Thu, 20 Jul 2023 17:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 10/11] drm/mediatek: dp: Add .wait_hpd_asserted() for
 AUX bus
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-11-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> In order to support usecases in which the panel regulator can be
> switched on and off to save power, and usecases in which the panel
> regulator is off at boot, add a .wait_hpd_asserted() callback for
> the AUX bus: this will make sure to wait until the panel is fully
> ready after power-on before trying to communicate with it.
> 
> Also, parse the eDP display capabilities in that callback, so that
> we can also avoid using the .get_edid() callback from this bridge.
> 
> Since at this point the hpd machinery is performed in the new hpd
> callback and the detection and edid reading are done outside of
> this driver, assign the DRM_BRIDGE_OP_{DETECT, EDID, HPD} ops and
> register the bridge unconditionally at probe time only if we are
> probing full DisplayPort and not eDP while, for the latter, we
> register the bridge in the .done_probing() callback and only if
> the panel was found and triggered HPD.

-- 
Regards,
Alexandre

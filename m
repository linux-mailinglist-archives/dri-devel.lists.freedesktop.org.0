Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA4766DBD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B2510E6DE;
	Fri, 28 Jul 2023 13:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57E010E6DE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:00:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57dcso23305445e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549221; x=1691154021; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yic5Bry11hKn18+YDDsJcZ+oLXRJ3te0nRA7jPdDSuk=;
 b=C8SH7e13yDBuQNlBegZNj6Cjo6qnz1S13aPtEuLkjrMSfJ/0x/3F4YieBmzJhEWtsG
 /WJrO00RPtlKCp7uKiMh1NNnrW6LYFmXCwf2hY7xEIljqnJnBaMsWk6ZFfsu2azWTzA4
 8PGLxI1vVKylGrycsWVcmzdQo5EWwy/4oMwTvWIw5kLn4pNN5kta7bx4HGCzmNpL52td
 n1gYMGEFJVEnRXT3jB8/B8XSHloB05w8X+FJy5Ly8JUFit6OgWAo0mHSV4Ddwo6YkoSZ
 P4GvqfLxTUTFulnPzeXRPQhtIlheI3vn3rVPTddbHax7wUfqnfcv04KipcDfJ0dg3+IJ
 0ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549221; x=1691154021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yic5Bry11hKn18+YDDsJcZ+oLXRJ3te0nRA7jPdDSuk=;
 b=Kcoj2mjTO2rv14Blq31a140QdN0Vj6Gso1xihoXb3u4Q0wUp9FGGd4gHamrVbfsuuK
 hKqeiN1n6IOoT77W4leTv1mpq4uSRvYyihGLVQGKzbg9t7iLU535i6azILs5Cx6KOh9H
 G4KqSLIwH00gUeGtaRcCdzQLAnsY8PYQI0lDB0ZyZzWcM1bk/BFLRDCgl5ZNT8AHaFVF
 BcEAdZD+7MkzSaxhXxiw+YCbATvQPbnlxCQcTEvLe4qkxfvc+nNWTY8y3TjC1LytiR+9
 frxtPswr7uWiwI1SuTnWpfoRkd6CiTfll+WdT88oe2znnH1IC54BmPI07pdTMzVJRccs
 QVkw==
X-Gm-Message-State: ABy/qLbdDw6NrtvphSiGAcKpkFBiyMGQhp3botm/lwGwoqwl40vhzzsC
 O0qkfyLSgKNvMeo+keHRoN+qQQ==
X-Google-Smtp-Source: APBJJlFc/T42hioLjioKgeh5+0Y8oQql3aNGb6cv0TdhzPmmOfEvCeU7I9mo8PbPpDI5/FunIizlbA==
X-Received: by 2002:a7b:c7d0:0:b0:3fc:a5:2c3a with SMTP id
 z16-20020a7bc7d0000000b003fc00a52c3amr1638513wmk.41.1690549221035; 
 Fri, 28 Jul 2023 06:00:21 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c230900b003fbe561f6a3sm6950289wmo.37.2023.07.28.06.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:00:20 -0700 (PDT)
Message-ID: <49e7661c-a3f9-9f6c-3f34-5104ac60eca2@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 02/11] drm/mediatek: gamma: Reduce indentation
 in mtk_gamma_set_common()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-3-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Invert the check for state->gamma_lut and move it at the beginning
> of the function to reduce indentation: this prepares the code for
> keeping readability on later additions.
> 
> This commit brings no functional changes.

-- 
Regards,
Alexandre

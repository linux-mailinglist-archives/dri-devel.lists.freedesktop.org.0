Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CE87383F0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A89F10E45C;
	Wed, 21 Jun 2023 12:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF49B10E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:38:50 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98cd280cf94so67754266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687351129; x=1689943129; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FhbZVLRFRJkTRcxEmprI7xfESOe65znA2x7PCSJbP4w=;
 b=rX6xit08xL8hzTukILjewPEnGxlcYO5HBbI47Bw7rqKA5AjR4jFyG1ELr57YKg4TRz
 n1QiHHs9fPIIsKIh7k/GVzXx4RnRidzckIQ8HTZZRsqkQmJJ0azsD+REJSPEvrpOcyjg
 Jze9UkEE5qaaePRw1ySE8RojnxoU3ThJh9dxwScMAWiNDoKlvNY0VbJPetGTVDOFj7I/
 g7lsANh+TFP15DcIptX4lyDA3rSZ+FZxBCISG359k+R2tD/Ha6Zj9gSeN1KjwEP8oG95
 FzDCX5oBJ5DkhXOL1j0aMFp6dGspob1mBzUxvhVD6o4tg+C7GBlcUKKtyXgqaeViifxM
 ZVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687351129; x=1689943129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhbZVLRFRJkTRcxEmprI7xfESOe65znA2x7PCSJbP4w=;
 b=Qg1jXnOIwcM+VPRFjfONvDtOg2ldGnNLCoAVJoWiRcocVGRM6vDdVRmNyixXs3puf7
 Mvv0s7A44gALYBDxwQ82MDUMqyP1E+y6z95w9ZS9eFbCDKxJEcbRRD75zHsXlhTT7saX
 KaEWPa4o3DqQx/Y+4ikfR6hohrzGt5P+LvWz1kCDXI1i3RPMK3QNRyeVcp4fgBJ7/PF9
 qHgOD1aotQd2OzXXfYOHfeKbOsBLEjXwnYU9jIuZBs5zUnV08/5YLMFe0LMNiW2wcVgI
 3qjCrnaLp/fu6g5GPWJZstZtRdQr9DjvRjm89TGk0pBnUxf2c4nfNsG2yF3SQcoQzcLA
 AmZA==
X-Gm-Message-State: AC+VfDxUN1z8T8vR5vwFd6YV7VNkBSjaYbW25B9qVfnqKv70uTq45wTT
 oAQrVGgwLyePZmjm70Qcp8I8iA==
X-Google-Smtp-Source: ACHHUZ6BSMtfKwz5HW9GJYvd/KsZG+lavipJGEgd/TdkOKxDDjdlZQP0gQsDk+qCv1GjAFRUQENgow==
X-Received: by 2002:a17:907:6292:b0:983:ba44:48af with SMTP id
 nd18-20020a170907629200b00983ba4448afmr14707480ejc.53.1687351129098; 
 Wed, 21 Jun 2023 05:38:49 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a170906279800b00986d8722e46sm3145497ejc.17.2023.06.21.05.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 05:38:48 -0700 (PDT)
Message-ID: <a2adfff3-1fc5-b3ab-c4a8-df06dbf5bb17@baylibre.com>
Date: Wed, 21 Jun 2023 14:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/4] drm/mediatek: Fix dereference before null check
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-5-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230621102247.10116-5-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21/06/2023 12:22, Jason-JH.Lin wrote:
> Null-checking state suggests that it may be null, but it has already
> been dereferenced on drm_atomic_get_new_plane_state(state, plane).
> 
> The parameter state will never be NULL currently, so just remove the
> state is NULL flow in this function.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

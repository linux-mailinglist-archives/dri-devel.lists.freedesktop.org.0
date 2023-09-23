Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AFC7AC3C4
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 18:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3DD10E02E;
	Sat, 23 Sep 2023 16:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2CE10E02E
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 16:43:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so3734416f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695487379; x=1696092179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ehvNyN1e8AcFsIaExWpUQQDC3O+XNhpuGUxABDsT1k=;
 b=c199qlkXYKuODkIDD20fdq9+PLA93hruRMGal3TfOiE7re00o8kNJCPDlVD37U+4gD
 hbnZvZqIN4jWBlA/exPAOdFN9JbCHt7vQQd1WjoujTt8MEoWTO1yL1mUrwPzJbHNfyAu
 RDydcxSw+plQAN8gbDe2z5QUZNKqBNlg+EtMOIzSecE5o/krsG0bl0pzPVBccofyJdm/
 vU0qPObXdmTUkyKxHA+YKiBdL7l1TVIK0BYvVAXQlwCGAd7KWsjmzfMFVy+KLzvfoYNx
 po54fi0hcJd9xWUxqszWRwuqLIxB05Mkq4BaPyzM9zC8oAYprcknGxRTcajRfmNilFjW
 KQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695487379; x=1696092179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ehvNyN1e8AcFsIaExWpUQQDC3O+XNhpuGUxABDsT1k=;
 b=gV86PdyshGDEtAJDmiigc0HrNs9O9AWBK7EEe/2F20BcLCXkXt1ll6QUdo957PhCut
 WxQRCLGs21cptPoFo/SbTunsAlemBaVMFkxhR8iJh6sElnytKOlvTPGHHg6Z6+wo6IQC
 Gn2j4r3q9s7eJzot6mj1wELxnSGgZW/XmUfSrv4aTvtAutwbe2eE7FG3yOGIJ19mK9Ix
 YhzKvlTDE69URJH4u6Xs3Tpmg4YqGBdJ7YTDnuvOpxNBfJ7IGCmIkvTtULF51wfACEuD
 esFz1/PCVvO2zwYuab8/IQnZpdgmKGY2wipUraULpf13/7XQChuuPshvyhS2x+k8865C
 a0mw==
X-Gm-Message-State: AOJu0YyYCCsv1wvmaRCsHB3JuOjpiYFpg0KYjj9RDgA73MNzPF5R3tkI
 fxFdUgpvAs88W6T6zunvUx8urQ==
X-Google-Smtp-Source: AGHT+IHeYkcu/RtMUX5lf2uTUiwk5whv3Kim5HQRxv8v4Wkt6ThO4w/ApV1UJK2BVwSR7UZ8q2JpuQ==
X-Received: by 2002:adf:ea84:0:b0:319:6327:6adb with SMTP id
 s4-20020adfea84000000b0031963276adbmr2170369wrm.70.1695487378995; 
 Sat, 23 Sep 2023 09:42:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c21ca00b004051b994014sm10434968wmj.19.2023.09.23.09.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 09:42:58 -0700 (PDT)
Message-ID: <4fdfe29b-aea7-8180-d2e3-5caa1beb7232@linaro.org>
Date: Sat, 23 Sep 2023 18:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 02/16] dt-bindings: media: mediatek: mdp3: split out
 general properties
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2023 09:21, Moudy Ho wrote:
> In order to minimize duplication and standardize the document style,
> it is necessary to separate the general properties specific to
> MediaTek MDP3 RDMA.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../media/mediatek,mdp3-rdma-common.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)

I don't understand why this is a separate patch. It's not used, not
effective and not visible for us how it extracts common parts.

Best regards,
Krzysztof


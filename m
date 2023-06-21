Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB407382AA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EE010E44F;
	Wed, 21 Jun 2023 12:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F191810E44F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:12:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5189f49c315so6294873a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687349576; x=1689941576; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1S20z+a2meRa1t5ROBbcRF+0qtIDSZlETYaPDTmCWIQ=;
 b=wZf9FY946GCy+xy08dQAUqGP+uauiMOCv/PM7k9BbNqoR3/RkvS3CYXV2s6ZGIkVNR
 FJk1adEklzbuZBMmjE6PpZr8tYp3ywet4DtQCQyMrRsj6PRKEQjmXs9/rd3bnW3wRI1L
 mmjEVtAmGjy16C1OvUNyrmb3zeyTFgJ6CEhOxds/SexZVGmqtujvBi83Pbgs3kPO6ChL
 GAMvTUWJ/QkRXHbz08vg5arB4JoGTecjHD4kJs1zQVIPz3FIYdyNdKg6jmoKlQDk1oc4
 8obTXmXlgcvpR33IhpRjN9oYq3VkZqxHuPPDLbciOPbrLxaYU7HBawBYz9YuqJtMaoUI
 +MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687349576; x=1689941576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1S20z+a2meRa1t5ROBbcRF+0qtIDSZlETYaPDTmCWIQ=;
 b=MKMalT1XLB4zWeM0tQJLbfdQDuMjif6Cn2RiR/j3It0OBXFa/G5+/y27Q3ECHbEKnV
 a9PsY7uMYRPBNm+n2H/Ho34jxCzIRg7nh0QdVU9JGIVzpbeZ90geK54fGfOu4JaCYCqq
 vcSindJeRd25q5wR56WZlpxU8jhSySdWyEELec6Kc0ZlZMs7VL9h7e8SO9ifLuCZWHCa
 Q3nVhkSHJaYsYm/4FbKpJ1fwF0qg3e2qIKaES8CexoL8iZzS1Cog+TsZ0bYa3PvzMlmS
 JzXUtBEqNBbeaMSFtwWd39tO09i87eNaEOLL5pNq4Gs+GVvU5D3CJBQFyZ9s656EVtkT
 ithw==
X-Gm-Message-State: AC+VfDw1Jk+WAUrOAtYxCMjwBo6SP23sPPAksdwJ9lEcdTbWQHVn43g6
 Bh5U7fft6wkoKY3kpE/DE2aDkTR6Y+qccd+DDw4=
X-Google-Smtp-Source: ACHHUZ68VVDiFM83434iVSkRffqR1mrfuPtN7Pi923y2gXxASrxcfPNxrl0l2Ti4w63d8TcW+BemvQ==
X-Received: by 2002:a17:907:d1a:b0:988:e223:9566 with SMTP id
 gn26-20020a1709070d1a00b00988e2239566mr7643882ejc.62.1687349576599; 
 Wed, 21 Jun 2023 05:12:56 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a1709063b4600b009891da61b1asm2911773ejf.44.2023.06.21.05.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 05:12:56 -0700 (PDT)
Message-ID: <7c5acd58-e7b3-097d-329e-15cf4f6bc4d5@baylibre.com>
Date: Wed, 21 Jun 2023 14:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/4] drm/mediatek: Remove freeing not dynamic allocated
 memory
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-2-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230621102247.10116-2-jason-jh.lin@mediatek.com>
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
> Fixing the coverity issue of:
> mtk_drm_cmdq_pkt_destroy frees address of mtk_crtc->cmdq_handle
> 
> So remove the free function.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

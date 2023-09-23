Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DC77AC43C
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8082E88E45;
	Sat, 23 Sep 2023 18:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE21110E071
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:01:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9ae7383b7ecso657351666b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492110; x=1696096910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mkku8F0DMrFfXF0YIjXe4KyjDZIaTDOE7BzWPGxhwkY=;
 b=eohLWH7hPkP2NMhhJr3+AcgzGdpDAuy9DIpHjHs+lDbiArjeguaesB2PVxG50zPYei
 zRs5EVisRUjfkheeLqc9vn3h0Ikn5GoaTBFh7cVoHHF7QsubWBV5gqJ01z1qOPHWxkZu
 A+YIa1DjokDzWpnxcxqVYdiEaKd9tVnckYvqVb44nC+Ur6e0ZdY61TxlfE1AoykqK3CD
 6PYmItV1SvYNVy/ndx9sww5BLJ9Hwi7MXZO4HUf8HhBcf//N8qb09qK2CgAcndHzDtXb
 UFLaiXgQbolZggdGK487J3M0T0dEk9SvNs8Ch9iDHRqfF4taDsw7bCkEa8e/XhYcxW6E
 b0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492110; x=1696096910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mkku8F0DMrFfXF0YIjXe4KyjDZIaTDOE7BzWPGxhwkY=;
 b=kHnNC+aKADbOrduSdFg5SMCWavAJAa5xuRCunE5BfbfE+TBmqPH69YKz/a5cEx96Fh
 LnkDGaT//NuQAsWiu/li253QGlFi7CNbToI9+z4hVwhcgcwxjHsj3lvqoN18V3qEGLS2
 kARJIcaiH4g5VSZvCoV4pQahZ53iiTS5rZFo+yUShaq5IaHwjpwzW0OTZ6d4TH6TjYP5
 GZ07erHgCqqsUndsgy+RRod/2Qu5cDXzDiy0A+KP0BXXBUnAm9Qzm7n2PcvC3+gOIty4
 8ULcwOqiWv9ESrshVI+FIXjZZy+aT6JrbJ51KbOltvP/KErpAxdvqgzjWpEystnS9ECc
 L1WQ==
X-Gm-Message-State: AOJu0YztM/R2wcDvOdrluE9rzB6hUcUiCsqR9A3Mh4GB/3sM++Ze5g8F
 BoWNG80SsbvBMSewpw1jf5Bt4g==
X-Google-Smtp-Source: AGHT+IELmFBn2dpbejDFb/Fe2tZEBl+utRg6aNguT/ibSdIbYeXZPhhAouR4ibqW7DIdCESfHjVItQ==
X-Received: by 2002:a17:906:768f:b0:9ae:4a8b:fe2f with SMTP id
 o15-20020a170906768f00b009ae4a8bfe2fmr4486659ejm.11.1695492110260; 
 Sat, 23 Sep 2023 11:01:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a170906179500b00988e953a586sm4192183eje.61.2023.09.23.11.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:01:49 -0700 (PDT)
Message-ID: <20372e40-e4fc-467a-d91a-fcf8e26728bc@linaro.org>
Date: Sat, 23 Sep 2023 20:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 02/15] dt-bindings: gce: mt8195: Add
 CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-3-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-3-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> CMDQ_SYNC_TOKEN_SECURE_THR_EOF is used as secure irq to notify CMDQ
> driver in the normal world that GCE secure thread has completed a task
> in thee secure world.

How can #define be added after its usage? Does it even make any sense of
being separate patch?

Do you folks in Mediatek have any internal review before posting?

Best regards,
Krzysztof


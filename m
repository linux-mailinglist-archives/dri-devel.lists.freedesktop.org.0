Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E96819C5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 20:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB8A10E04E;
	Mon, 30 Jan 2023 19:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E41410E288
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 19:01:38 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 y26-20020a4ad65a000000b005173859761dso830099oos.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 11:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7PNJxFH7gDdMse434RHu5JL4B3ooE6c7lUdvQTDPn8=;
 b=TQy4hkL49QqWLLXoYB0WfzeSnXLX8M5dtqpfgNT6aHQKo1WWAU50D7cpk7TWfISxwn
 XrfkomeH8zDTFLCCtRr3qSdGca7YdLGIb4+dohMrfyBUGcO14VlZD1GCNmsAeVV19USe
 QYgFbH/1HTeW23oPTyPz4EKLUc6QQYnhr25OM+xdoAP8RFNkv2PPxMFPTyWQfng0Hl5L
 vZ1LXWVX1FjYPXhSi6pDU0ITjpJnLab98+e456mS0ZoHTc/PDGR/3jT7vpUGNjuGONb+
 cUN6GTzxqxTRhJUPRmnbWi5cxlPs7IwNgzt6zH3ocTl3Uz8K/wXf3C6k/FEZqU4+X4J1
 QwMw==
X-Gm-Message-State: AO0yUKUR8BFTNMf9l12xDrpHUTp6SyCKFd1Z9HlHUrv+2Zd63+Ht/8JQ
 b2hcp36fwLExD9lIy72t/g==
X-Google-Smtp-Source: AK7set97447YafxHmlkxrDII2zwtdplxGb4q+5/7vfjzRM46vNJPfFHa7ECNiIQqZTPgAbRKA+zFug==
X-Received: by 2002:a4a:346:0:b0:514:d8f0:45b0 with SMTP id
 67-20020a4a0346000000b00514d8f045b0mr6845375ooi.2.1675105297531; 
 Mon, 30 Jan 2023 11:01:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w6-20020a4ab6c6000000b004fc4000ae48sm5252918ooo.15.2023.01.30.11.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 11:01:36 -0800 (PST)
Received: (nullmailer pid 3121442 invoked by uid 1000);
 Mon, 30 Jan 2023 19:01:35 -0000
Date: Mon, 30 Jan 2023 13:01:35 -0600
From: Rob Herring <robh@kernel.org>
To: Rayyan Ansari <rayyan@ansari.sh>
Subject: Re: [PATCH v4 2/2] dt-bindings: display: simple-framebuffer:
 Document the panel node
Message-ID: <167510529465.3121384.11904840013697184141.robh@kernel.org>
References: <20230126182435.70544-1-rayyan@ansari.sh>
 <20230126182435.70544-3-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126182435.70544-3-rayyan@ansari.sh>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, janne@jannau.net,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 26 Jan 2023 18:24:35 +0000, Rayyan Ansari wrote:
> Document the new panel node and what it is used for.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml  | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

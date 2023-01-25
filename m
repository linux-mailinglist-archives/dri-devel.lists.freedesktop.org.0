Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A112B67AAE6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 08:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F4E10E733;
	Wed, 25 Jan 2023 07:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3E10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 07:29:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso591305wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 23:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q/zYb3mbFmjgoGxZfiqbziu2v8uAqk6hubRFYbxoSlc=;
 b=t6xI6eMY7T3NthJ8wINZKhVY4l2iBv+ao3N88MgKk0VGCKAVAjNjw8mNfFy8BTBMrG
 XgidFiiVBZBy+anLYqLhffAZjms+FGkPzTpgdgnOnKSncoQUPWV1lcSdkygzL6EmuW9I
 4YPGTwFyfLQOaUhDJF3SpXECnzEX6vwCg3ET5kHJ6xam4Puzf/80T1ksN+VLIA6uATxM
 ZIPYrNJhgunMvk8sPM11Gxirc6WS1IrmdvW+3qz4dhYDIXvg9He/GVuvPhOyqetY2ajJ
 Q0QJkv8Dp6PCcbuqv+Sc2JLYlFXFqJwX6hoB35vzT0V8JsJlK22MFGGMsMDn3OWfyhm3
 N3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/zYb3mbFmjgoGxZfiqbziu2v8uAqk6hubRFYbxoSlc=;
 b=NGA+DCrUxiOMkfEouZVAsGMf4zrsA7+8ryYVZB3Fw5MTpYLyM7sOYRCK8zX+CJV4UN
 qqWVM8urNv+Wa8TMfSKm9oZk8luudaykoMccwRzpL8GFPsNaDwRfEdJZ3DBwehHAhrqv
 55htMyAO+aUVFG469pgtyOYtG6Oadl+eXtOgPHc02qTYUIeDxDnN7W0/D+lu50WGUv1m
 ozptGhE1ur3qrye+1jH8ynBKHLfGncwM0DzXcMpxgslE4c0AEyDLUAOIzQE1nmEKzhcj
 EwNhWielS+qBVaYmzZN9ZAma4A3keveOxkyqmCnYZ30FVG/6vdnGnabQ25WEcmv0OP6d
 H0gg==
X-Gm-Message-State: AFqh2krLoDsJ/NimrrEXzkNGNxmjuu1E+h1vCAfdu1hDUYLat1sspWYt
 Okqb7JuSOrOaJZ67AzS/BMXJEg==
X-Google-Smtp-Source: AMrXdXt9SGOwxEXr5Ol6TM9T8P204nWihJ4QLUqzCiu7G3/To6p6IruhCE/rq6883y/w0Ulpsu1yqA==
X-Received: by 2002:a05:600c:c05:b0:3db:2252:e50e with SMTP id
 fm5-20020a05600c0c0500b003db2252e50emr23239325wmb.24.1674631755424; 
 Tue, 24 Jan 2023 23:29:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g9-20020adff3c9000000b002bfb29d19e4sm2778121wrp.88.2023.01.24.23.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 23:29:14 -0800 (PST)
Message-ID: <90125055-929b-fdd1-3489-cfdc913594a5@linaro.org>
Date: Wed, 25 Jan 2023 08:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Content-Language: en-US
To: Rayyan Ansari <rayyan@ansari.sh>, dri-devel@lists.freedesktop.org
References: <20230124224142.7133-1-rayyan@ansari.sh>
 <20230124224142.7133-3-rayyan@ansari.sh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124224142.7133-3-rayyan@ansari.sh>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2023 23:41, Rayyan Ansari wrote:
> Document the optional width-mm and height-mm simple-framebuffer
> properties.

As pointed in previous discussion - you should have panel node and take
the properties from it. The physical dimensions are not properties of
framebuffer device. These are properties of panel.

Best regards,
Krzysztof


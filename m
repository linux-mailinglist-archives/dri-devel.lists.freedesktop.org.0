Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B069980727D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40C510E724;
	Wed,  6 Dec 2023 14:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA8210E724
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 14:33:48 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3b9b6ba42a4so457443b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 06:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701873228; x=1702478028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDDAuWhtXVi6mwzIZ2z8R0mIJpjQ7oFVtssyW42Nqpg=;
 b=XOuG7EvHngAe5wCHmW/Q5mek/oTTYpPyYUhFXyGUmZZpvKDMep1TnJyfT0iiYTyzBB
 br+yVIYeJT84OqpSLUPPFIDsHfyWxmEDcT50mvEyrBGcG7hKVFohiiDIVgBeb+DaDu6J
 no4rItsN6NSu/iW4EyaJSpnGiYeug5fS/gQ32q1p775zCaU65zUdLk7gkWsSeJD+GT+W
 o1JP7ahNhXoKAu1WOA/dO9KCecRoDJs083iQ2fxTww9boYSs9CkNs17CPwWQPfL5tg+B
 Lyo56cCJ3nnf/NZ1+c2fo+9ZFsrkensnwEHAjj+Ij8sTbGvZJt7QiyWCthAdMmPYl3Bd
 zl4g==
X-Gm-Message-State: AOJu0YxO/+mIMZljUGEYz8h9s7giZqi0mcmQQqUxkuMUQexE9THN3dnC
 UQ7HHYOp7hLkAVVYErHT4g==
X-Google-Smtp-Source: AGHT+IHSFVmUd8gQfUe3FDNE1USXgg+9lsK6DN+nNv+ID/1SC1HIP7fcqvVag9LfmmGU0nP5b6pCFA==
X-Received: by 2002:a05:6808:8c1:b0:3b8:33fc:7ca9 with SMTP id
 k1-20020a05680808c100b003b833fc7ca9mr1431384oij.18.1701873227680; 
 Wed, 06 Dec 2023 06:33:47 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o6-20020a4a3846000000b0059034d09dd2sm8796oof.12.2023.12.06.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 06:33:47 -0800 (PST)
Received: (nullmailer pid 2107555 invoked by uid 1000);
 Wed, 06 Dec 2023 14:33:45 -0000
Date: Wed, 6 Dec 2023 08:33:45 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 07/10] dt-bindings: display: panel: Add Ilitek ili9805
 panel controller
Message-ID: <20231206143345.GA2093703-robh@kernel.org>
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-8-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205105341.4100896-8-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 11:52:54AM +0100, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Add documentation for "ilitek,ili9805" panel.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Where's Krzysztof's Reviewed-by?

Rob

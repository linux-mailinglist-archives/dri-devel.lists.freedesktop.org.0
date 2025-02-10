Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51B9A2F1EA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 16:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0F410E589;
	Mon, 10 Feb 2025 15:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QXmIzg26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9D910E589
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:40:23 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54505191cdcso2121343e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739202019; x=1739806819;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZz7wBdHRx1Y/NJmXMgTjFcJ/vA2swa3TSGqQIhUusI=;
 b=QXmIzg26k6E2WH00jnupLiewFsy5Mv4a98FXEyBtroMa6Axa2tf3Q6W2sj+/RjtqCA
 DyrjpQKH8Ru3Q8CnFSKmEdOUiWoPpLTwS0N5+aqwR/qzqjxT2PnSFE22ahIZ8KUOHE4J
 eUWk4htmKC/z8x/hbwcuamucBWEVS89D0aQsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739202019; x=1739806819;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZz7wBdHRx1Y/NJmXMgTjFcJ/vA2swa3TSGqQIhUusI=;
 b=CPsNDAqmSWOlv6a8dQday2fqzjZLBVnS0tuZ6H0s4qLBu1vSOcU8xVu6Zo7d3w5vo/
 LlQpqXyWm1y6SZz9WExlKIgBCmkYKm18bEgmBuEBsAjNDcC4wsIxg54bHgU8QEAmR1Kg
 PgoT0IufBHChQ/fjr3jFJ4qXiwraq3mVjAUXpNXwD/zkCwolDZpEebgrVTyFAdb4tJvj
 GzU9OXZTt0mmEm7XnkFd2DhYNHPKjd8+AM9a3jSnI/he0t6tEBQRoF5ArpkoFmSm92L4
 8qrVyr5Hs4J3MHncWGA6ZbXS3j/IeKV/jjVdzzw670guOHpfLsh7LZJ0MNouPQ32TrD9
 9GZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNMTNS883k9494A00ikEvurABKWhUGOot3/3656ftFns3yEzonfA3rFVpAFr3uCtmUFwTG49WvG6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXssOzrv7Z4w017AfxewdkRdJ2JdacE3FGGKjL1J3P7ZN0JsoK
 /hYWiFt8sbdrNlypPSKS+0O7jmqEfy9+8axPiwrM1ozUlfHPHaajNg81AED+AYGF/vovu/9oO/P
 adg==
X-Gm-Gg: ASbGncs89WnNDqkbGDoVXf3K9s/lPOQ/3Wo03QfP8gpf7/M26u4PsBKnFEGL9EEJPAx
 r5GjIRlGxZAmgo3pv2w3gbmAqMlEeuzw3co4/Ma+VMpTrtAvn2p7QzP1SVbD8YaiDeVBhWDh4yc
 HHpsEFr5aP0a8grjh/f6eH2q0PkImXYwV/H1tVuDSqzRbg15YR8aiM0yfyWb4TIpjIarseJTxt2
 9YkuIPa7PtS3wx+iGuwCft1WHvPR/+COcWQoukfGWB7d2AUQX5SmUXB/UAZds9APRG16iZYs7Xt
 Vd7rue9uS593JQZVqfDRtlUnNgIZ5+syQqL5muQY1z6p9LbAeD++OCHnypA=
X-Google-Smtp-Source: AGHT+IFYEjHhekUvMKtUoRCGKxBLr+LUFAILGEP8CF6W5rtC1UmB+/AENR6+aXPcdCWKcUXvF5vNWQ==
X-Received: by 2002:a05:6512:3ba8:b0:545:1104:6178 with SMTP id
 2adb3069b0e04-5451104668dmr280284e87.24.1739202019565; 
 Mon, 10 Feb 2025 07:40:19 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105f2edesm1268539e87.177.2025.02.10.07.40.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 07:40:18 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30762598511so44682941fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:40:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCPBdi5nQhk4Z0uFCgrdyKB0732GV4qxIc5FQid3Fbw3fSYnFLOxeq/T+sJv7Vi4vHjY/+rE5XYMI=@lists.freedesktop.org
X-Received: by 2002:a05:651c:198a:b0:308:f580:72a4 with SMTP id
 38308e7fff4ca-308f580765amr6925791fa.1.1739202017277; Mon, 10 Feb 2025
 07:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
 <20250210-rampant-uncovered-buzzard-c96e31@krzk-bin>
In-Reply-To: <20250210-rampant-uncovered-buzzard-c96e31@krzk-bin>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:40:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPW=0eA-0VqNb+=75Q9dB2TCaJstcAhKEevk7Bhx7J9g@mail.gmail.com>
X-Gm-Features: AWEUYZmeIn_U_nhTSVtFx4mkzD6jTp93vru0sCx3dywqhcvaZxLtwogVx1qWx-8
Message-ID: <CAD=FV=VPW=0eA-0VqNb+=75Q9dB2TCaJstcAhKEevk7Bhx7J9g@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible
 for the panels KD110N11-51IE and 2082109QFH040022-50E
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 10, 2025 at 2:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Feb 08, 2025 at 06:53:24PM +0800, Langyan Ye wrote:
> > Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
> > STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
> > add the compatible to the hx83102 bindings file.
>
> Your subject does not fit at all at any reasonable limit. Keep it
> simple:
> Add KD110N11-51IE and 2082109QFH040022-50E
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Adjusted the subject line and pushed to drm-misc-next:

[1/3] dt-bindings: display: panel: Add KD110N11-51IE and 2082109QFH040022-5=
0E
     commit: a8505237066d054cd6ad63b52e7219ce41731753

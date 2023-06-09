Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76670729FAE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 18:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988E110E152;
	Fri,  9 Jun 2023 16:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C5210E152
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 16:10:17 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-77703f20aa9so84944639f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 09:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327017; x=1688919017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zd94wwjNm5lzAbgn1yoGEBqb6vodjF1zy+V+iYm+O84=;
 b=DGZXptvQ67MIL0/w73/qLQiTwoLDzozExgrQZY6Wjf7moPZ8Kj+jHZQc3zZ9VVMGhF
 wB51IhIjHAdImbtj0Q+++p50E5T2UXUTDYPf0N6wcQfIAitAqb7chNPoDwUrcb1GSCwG
 aRqT1JrPsjNlZSrW0KnkkTIw7Ic6xJNuIlF3ZiG0ppzsztAmIRMhj2JrdmGOa6/F9/8+
 wHm3nGxvAHUBQcPHW30VGNEzDSHbFoa2kp6ege71GeWPKsqbHUH0FJXM5dERnxbFLmij
 sOYcY5QDE0p7b9GfOnRV/ohLY49h3Uc2058aJghKXemnyFZhr9xUcj2vsC9V92ICRjB1
 m2Uw==
X-Gm-Message-State: AC+VfDwXWtB1vSj6QUgh99slExxqo+yY0BQnw0PA5r1FcW2EoBVhwq42
 Dgw1ZLqmCSJttPRIKONVyg==
X-Google-Smtp-Source: ACHHUZ5aby7i6WNeqG7cRySeJ0rvFhKrIopPGxiceV4GEP9w3UVUAGbb26dgZS2yB99aNdU6PZToBQ==
X-Received: by 2002:a5e:8301:0:b0:762:f8d4:6f4 with SMTP id
 x1-20020a5e8301000000b00762f8d406f4mr2026408iom.8.1686327016950; 
 Fri, 09 Jun 2023 09:10:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a02a382000000b00411b8c1813asm1022248jak.159.2023.06.09.09.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:10:16 -0700 (PDT)
Received: (nullmailer pid 1163931 invoked by uid 1000);
 Fri, 09 Jun 2023 16:10:13 -0000
Date: Fri, 9 Jun 2023 10:10:13 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 04/10] of: property: fw_devlink: Add a devlink for
 panel followers
Message-ID: <20230609161013.GA1149945-robh@kernel.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.4.Ibf8e1342b5b7906279db2365aca45e6253857bb3@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607144931.v2.4.Ibf8e1342b5b7906279db2365aca45e6253857bb3@changeid>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 02:49:26PM -0700, Douglas Anderson wrote:
> Inform fw_devlink of the fact that a panel follower (like a
> touchscreen) is effectively a consumer of the panel from the purposes
> of fw_devlink.
> 
> NOTE: this patch isn't required for correctness but instead optimizes
> probe order / helps avoid deferrals.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Since this is so small, I'd presume it's OK for it to go through a DRM
> tree with the proper Ack. That being said, this patch is just an
> optimization and thus it could land completely separately from the
> rest and they could all meet up in mainline.
> 
> Changes in v2:
> - ("Add a devlink for panel followers") new for v2.
> 
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

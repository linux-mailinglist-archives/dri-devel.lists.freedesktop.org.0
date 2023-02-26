Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04906A3349
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 18:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC23610E155;
	Sun, 26 Feb 2023 17:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE6E10E155
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 17:41:34 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id cf14so4449691qtb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 09:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oidyFnhcS7SwDqjuHZ47EAjwcEKM/kzqjGY4pjnCZ0=;
 b=jEUeW71eWUUch+YVyQMCeKQtp5vybtLgKdoEniUacE0kMC4VXCsyWGoFmFkbzme7ze
 0YibZzhF5oFJu2RCiUdmQ3iX99OGN9f/BjlVNcDi7SDAblqms288DZm2hh+VMAokU2W0
 8U3y+C5n2mJWSVBavf5lmwSSqYJ6ddF4hpVpsQ7vaOd/Nvfcj/Nb98K2UZFSzo5X7823
 KQypLIqY7QSntYD+oNkp8AdC63QrA7zQWjf2aCpRXCfVo8KjtjSGs0jzqukUbwGDK7SH
 3ircBpDmc0voQw96itrN40R3XJxC4nDAvOycdw/OkrGCKwzmXXr+P4tOLOBGbXm1B2/D
 EP2g==
X-Gm-Message-State: AO0yUKU8RbUv6mIQ3mdx6dnu9eSBdQaHSgp1Gi+8qkdPuurFea8ml0Sm
 fOFA5Qg3c9lnmdaDAHmEJATnfvdgBQ==
X-Google-Smtp-Source: AK7set/p6zXHndIgy3naW4KsapFBmsx01fo+3V13vxRFXmMQ7ZNQx7kg0PJq2R0pDPuK8sjHMvLOEA==
X-Received: by 2002:ac8:5f47:0:b0:3b8:6b57:499e with SMTP id
 y7-20020ac85f47000000b003b86b57499emr26477536qta.36.1677433293336; 
 Sun, 26 Feb 2023 09:41:33 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
 by smtp.gmail.com with ESMTPSA id
 e16-20020ac84150000000b003bfa932525dsm3229206qtm.51.2023.02.26.09.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 09:41:33 -0800 (PST)
Received: (nullmailer pid 74900 invoked by uid 1000);
 Sun, 26 Feb 2023 17:41:29 -0000
Date: Sun, 26 Feb 2023 11:41:29 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Lenovo NT36523W BOE
 panel
Message-ID: <167743328941.74844.4868858650095166172.robh@kernel.org>
References: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
 <20230217-topic-lenovo-panel-v1-1-9d7ee1602089@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217-topic-lenovo-panel-v1-1-9d7ee1602089@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 17 Feb 2023 12:29:07 +0100, Konrad Dybcio wrote:
> Add bindings for the 2000x1200px IPS panel found on Lenovo Tab P11/
> XiaoXin Pad devices.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../display/panel/lenovo,nt36523w-boe-j606.yaml    | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


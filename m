Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18332154D39
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 21:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240306FB48;
	Thu,  6 Feb 2020 20:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB51F6FB47;
 Thu,  6 Feb 2020 20:46:14 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a6so43881plm.3;
 Thu, 06 Feb 2020 12:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l5FvaNiAtzMYswvlFr6v0YaM1iOHco5V/a0AR5TCzVA=;
 b=M9Q9gT6LqcfrmpKPJliDyBRKfACIz6ohUlOMd5rH+AyJOy0Edq1ULCUNiyTH6roqSi
 7x9qzoItLtthuTG+nnouZ4muWSCKEtKs74wLdkhYSh+WBv2pAqOzUynRlKy8WMM77oxp
 6WA6GU5fc2NkD7VXEi1BEvyHNdUjSi9y5keVZzrqx8cm98eHzuEeTb5hiV5wWwYShTJy
 tU5B8+zOYShK1Xk1TbNkUUGFXqe0ciG3mgApy3xTXWX07KXcO+7iUSAsG/qMHRTt367F
 S1P+ikTc1aKNfApqcXSDz84+kpEYbfsu9SC/2/HETHNzNPFJkjrMZY/BHn217VwTudV6
 8Xag==
X-Gm-Message-State: APjAAAWmfa/69YkvJbw86Rm+BWjH15502IVwmZknLBnGIqeA9HX1Acb2
 c2MWjwn0O2ZCOsuUwy9qyA==
X-Google-Smtp-Source: APXvYqwvDRaorolz00MleJCnJNgdTgpyUgIq0k/Rh07UG3JXyWjdd+l7GKasnxQgNLs9FQRIpoGJVQ==
X-Received: by 2002:a17:902:8d91:: with SMTP id
 v17mr5698026plo.53.1581021974341; 
 Thu, 06 Feb 2020 12:46:14 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id u7sm265881pfh.128.2020.02.06.12.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:46:13 -0800 (PST)
Received: (nullmailer pid 32672 invoked by uid 1000);
 Thu, 06 Feb 2020 17:24:52 -0000
Date: Thu, 6 Feb 2020 17:24:52 +0000
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] dt-bindings: display: Convert etnaviv to json-schema
Message-ID: <20200206172452.GA32579@bogus>
References: <20200129085613.3036-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129085613.3036-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, pierre-yves.mordret@st.com,
 philippe.cornu@st.com, airlied@linux.ie, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, maxime@cerno.tech, linux+etnaviv@armlinux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jan 2020 09:56:13 +0100, Benjamin Gaignard wrote:
> Convert etnaviv bindings to yaml format.
> Move bindings file from display to gpu folder.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 3:
> - describe clock-names as enum to allow all possible mix
> 
> version 2:
> - move bindings file from display to gpu folder
>  .../bindings/display/etnaviv/etnaviv-drm.txt       | 36 -----------
>  .../devicetree/bindings/gpu/vivante,gc.yaml        | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/vivante,gc.yaml
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

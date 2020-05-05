Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AF1C5BB6
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 17:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411936E7D4;
	Tue,  5 May 2020 15:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FE06E28A;
 Tue,  5 May 2020 15:40:32 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j4so1986966otr.11;
 Tue, 05 May 2020 08:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lN6CEFyeKZCFu0OJiCgZWccGf+eFusscJwKLXSk5KTI=;
 b=nrNxE8dVF/QV+o1WEjsJ1ey620N2WZVYaXrcUz+yGpix/5ucNM8QVqVZoJTTN7ytOl
 7p5iTqIyZ3C+rrv7O6WckbZUXLEZ9vWN+L9y66dFML9sKpsmzS6yBi/TPtOsS7wSAiNn
 k4conJXSePhDkEWpa8RpycadGyx9JMLbTRSjuEahUy7povYMgiAXzlGSaG+NE1rS2yGI
 ey8COJa4jOedlaV3h7jRtKa8/foCspUlaeN7W0UWX0vC0wOQa0t/tvKXABIf3rrFZYmG
 fVm8w2fLJsPItvbKJFzWf+k2Kx4Aq+sMy9jNPnSd3MlpZzJpZ4RYzJXKxhAXg8wQKEfA
 IRog==
X-Gm-Message-State: AGi0PuaJCGl/JYsbKjZVF9nQAbPICUTKt8Za1eHmBI5uTp7u9CFmKmfq
 4dDDsYy3KD9k3W4zwnoOLQ==
X-Google-Smtp-Source: APiQypJLnfn8+KV4pOh2+Rr7e1217JEIk7U8xJPNQrhvgNj4MtAa2UJIT/k5Lny39ebo/r/5cevLSA==
X-Received: by 2002:a9d:6f86:: with SMTP id h6mr2873011otq.83.1588693231137;
 Tue, 05 May 2020 08:40:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r10sm685013otn.70.2020.05.05.08.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 08:40:30 -0700 (PDT)
Received: (nullmailer pid 4301 invoked by uid 1000);
 Tue, 05 May 2020 15:40:29 -0000
Date: Tue, 5 May 2020 10:40:29 -0500
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v12 2/2] dt-bindings: documenting compatible string
 vendor  "visionox"
Message-ID: <20200505154029.GA4222@bogus>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200429054515.4976-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429054515.4976-2-harigovi@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Apr 2020 11:15:15 +0530, Harigovindan P wrote:
> Documenting compatible string vendor "visionox" in vendor-prefix yaml file.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> Changes in v11:
> 	- Added compatible string in vendor-prefix yaml file
> 
> Changes in v12:
> 	- Fixed the string to clear dt_binding_check errors.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE4E1F4962
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 00:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619B6E34B;
	Tue,  9 Jun 2020 22:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4364B6E34B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 22:31:04 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id 9so19988ilg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 15:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vYoeWWotqh93ig2BYtJAr3lGDAZI+A0/XOPu+XE+VYs=;
 b=b4i4aP6/kWQv3vcfPJiHr/QfX2r8Y2i9i+Vz2cODcoMvUbH2/Sf0FweQSFGDzcQmDu
 J0kB0iNX32EIVtXnikIhrYT+tQuwCd5EyiPkj3k3B6yqpiiiE2E2kpBxSGcZz5h6yKca
 ldJWTfELEW05p7MD+6HgLTuKmp1L7ZCWLQQ9pYOSqyWYZ3ZzXNP43Ee8d9cvUULlhMzl
 FaxLBTR9Al6ZpVWPAZ9OqHPWbhXV0O2+Ri5TC6OK/Acr17pCiqgtvuCN93lR/FdUGdXx
 rYXbeDsTcZLgKyb3VHZwPEfZI9qrOPMY90DPVhYhic/kTlT8UYkJznVlbQmZRoYz2Znh
 jypg==
X-Gm-Message-State: AOAM531UU9YZcwyOkwnH27ejkgD77qzSE3bGQxDhEB3G7tGf3475T/Hi
 0ZhDt5EUyoxnsdZG1eG3kw==
X-Google-Smtp-Source: ABdhPJwWpAiV5EGKt7CuKPY/553uptexohIYjy37PNgvS4XgGdCOYFUKmhhe40UdXuL1Ryen5omTpQ==
X-Received: by 2002:a92:2a0c:: with SMTP id r12mr191984ile.275.1591741863507; 
 Tue, 09 Jun 2020 15:31:03 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id l16sm1273481ilm.58.2020.06.09.15.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 15:31:02 -0700 (PDT)
Received: (nullmailer pid 1618083 invoked by uid 1000);
 Tue, 09 Jun 2020 22:31:01 -0000
Date: Tue, 9 Jun 2020 16:31:01 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: panel: add Seiko 70WVW2T 7" panel
Message-ID: <20200609223101.GA1618026@bogus>
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601083309.712606-2-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 01 Jun 2020 10:33:04 +0200, Sam Ravnborg wrote:
> Add compatible for Seiko Instruments 7" TFT LCD.
> This panel is a dumb panel that matches the panel-simple binding.
> =

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: S=F8ren Andersen <san@skov.dk>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

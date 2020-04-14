Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9AF1A899B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6796189C19;
	Tue, 14 Apr 2020 18:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9323B89C19
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:31:41 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id o25so11279410oic.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=taRVZa25aht5wtqZEiTgIUDAQePNKgTm+F5r+ybEdWk=;
 b=Ywe6K5fjtz3uPDe8JJBjKK87N9zBzXhPESK5EmtOAuOMML5XxEX/6t08aOub1Rigyw
 v+IkG/Hh1DnT9Kn0WduJPs/EvUs9xcepYpYRkjHCorz0jfK2ipiHCHQIYMuqalMCw/up
 BpkNkahommAqSEZHRnZctE4lTzLsnHOj2kuIGf9TorivVG4KtvdOZPLdNUMyOZSW+aeF
 uCDNUPNJfMVDxvMAoJMc5mSbNG0ZoiQs5NNu7HulidaEpQIkdOW03ukqtem7dGd6dKwr
 0eH1b605AwRs9ca7dkDL+6JreqaEcv55yIC/hQTpxSUfdpv3t+roX14RcWG/rMEwDmzk
 +Wzg==
X-Gm-Message-State: AGi0PuZmyGLHN9ZczhrbLMx7V3Mnt/foySb2ItbXP5NH5g2APxESxnN+
 yNR6/cW4vNpK31hBmkddqA==
X-Google-Smtp-Source: APiQypKKcVloCWi3OdTWdLi0buDCJnFwulht3+4EHro8y1N+FYues9hY8JRCifPPYg7EDVkOEA4izQ==
X-Received: by 2002:a05:6808:7c2:: with SMTP id
 f2mr7562382oij.81.1586889100922; 
 Tue, 14 Apr 2020 11:31:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s73sm1329709oih.14.2020.04.14.11.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:31:40 -0700 (PDT)
Received: (nullmailer pid 701 invoked by uid 1000);
 Tue, 14 Apr 2020 18:31:39 -0000
Date: Tue, 14 Apr 2020 13:31:39 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 12/36] dt-bindings: display: convert jdi,lt070me05000
 to DT Schema
Message-ID: <20200414183139.GA557@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-13-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Vinay Simha BN <simhavcs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:45 +0200, Sam Ravnborg wrote:
> v2:
>   - drop address in dsi node in example (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/jdi,lt070me05000.txt        | 31 ---------
>  .../display/panel/jdi,lt070me05000.yaml       | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

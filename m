Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218A1A8A5E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666BE6E54C;
	Tue, 14 Apr 2020 18:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16676E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:59:53 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z17so801516oto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fDnUZtrdKTGiGhnSIeJA6CVXYIU/x6W/2zNXaYe4Y/4=;
 b=T619LGLcJlR4rfr2JwaBqoNvlpaqxtU/+h4lCJWNzCBD56XMJ4PI6ICHNiF+I98GRt
 UYzLnS0+rm3/RGTfOi3RODqkCZwP7LE0VvSTYJKhOs7SjoQojMCzuBKRZ16qfhCpkl7u
 7dDwShpnjtwJjBzG4N5VwvU4SaCOaGnHKvKJImP+kSfqw0m6NYpbDX2oS4Bi/n1d8sUo
 G1NK16ZI6s7dGeq2PBMxklpAwdIxB+ZYISWzbVbR0y/wpI3lPdcoJCXrW4U9Q1E/EqLt
 OAlSk/Ty2BqLnc/YEYq7vcZwTvX43vLdJRAGmDiZZZ5HHaef+eteec0u/0pU86kTNQ0B
 sMwQ==
X-Gm-Message-State: AGi0PuYSLusXT9nlTUUeQKhNnn39pnpqY7OGPcIMUg78xY+yXdexZMbW
 /TzFlqgzRnBx3Oe5oNgnfg==
X-Google-Smtp-Source: APiQypJMEqtVXwqiVumLGLRt18GTb050LSYrn1IgXBJZ2GTMevANMBLGsvqYlY9iCvyd3MIR7NTaKA==
X-Received: by 2002:a9d:19f0:: with SMTP id
 k103mr17841583otk.324.1586890792926; 
 Tue, 14 Apr 2020 11:59:52 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l28sm1487111ota.4.2020.04.14.11.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:59:52 -0700 (PDT)
Received: (nullmailer pid 17554 invoked by uid 1000);
 Tue, 14 Apr 2020 18:59:51 -0000
Date: Tue, 14 Apr 2020 13:59:51 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 33/36] dt-bindings: display: convert seiko,43wvf1g to
 DT Schema
Message-ID: <20200414185951.GA17499@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-34-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-34-sam@ravnborg.org>
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
 Marco Franchi <marco.franchi@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:51:06 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Marco Franchi <marco.franchi@nxp.com>
> Cc: Marco Franchi <marco.franchi@nxp.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/seiko,43wvf1g.txt  | 23 ---------
>  .../bindings/display/panel/seiko,43wvf1g.yaml | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E9D154E83
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 23:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1E06FB70;
	Thu,  6 Feb 2020 22:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902DD6FB70
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 22:02:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l24so28728pgk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 14:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QZbN+Rw9Wauw1FSQRjx1EufFnK6c8lNge5XZrv7SCxo=;
 b=LEONiLGEAiNqjozFu08+R/h26ttzHPzrpZ6kropyS7QFfJNWzw7LVX189BafyJmZpq
 vK3oGrr5+DrUmqRuVrxkVlAWwz+aU90BoeWiNBHgzZvynnz2M82CYMqfEKlAkP2vbdOa
 zmcfc3lnMrlPR8AeyNbTF5wI8bnuCjb7w6W/iUN4i/6IYiXZg+IR1HsEhcWDgB5H4b9I
 Q6QgC7iUK6q0sSUjOItYGVrJI6WlBrNn5Fr6IRJ6vTlo1UqX3d2VWH5GejnB0AZbOcNe
 mMZYzRINdrk+zxrFQH0yXQe/u/9jRotFCMreo3KWab78us/8gbeZTtOayNn4PUdR9ZC0
 3ugw==
X-Gm-Message-State: APjAAAUbINwj9tp3NAs2Oj2Yor4Bdksc+sNy7s+0jBXrgAAoFvJU/tzq
 QogjvTf4fWAUAHn0zukCkp7IVYZkFA==
X-Google-Smtp-Source: APXvYqzgCtK5jer0WP+jTalui8imMwVqNKHQY63IVhlORAQ77cic7EYV5b0qZ4PiE7a9I22N4V4rIA==
X-Received: by 2002:aa7:87c5:: with SMTP id i5mr6347609pfo.114.1581026557162; 
 Thu, 06 Feb 2020 14:02:37 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id e1sm348605pff.188.2020.02.06.14.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 14:02:36 -0800 (PST)
Received: (nullmailer pid 28125 invoked by uid 1000);
 Thu, 06 Feb 2020 22:02:34 -0000
Date: Thu, 6 Feb 2020 15:02:34 -0700
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: panel: Convert orisetech, otm8009a to
 json-schema
Message-ID: <20200206220234.GA28073@bogus>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
 <20200206133344.724-4-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206133344.724-4-benjamin.gaignard@st.com>
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
 Benjamin Gaignard <benjamin.gaignard@st.com>, airlied@linux.ie,
 philippe.cornu@st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Feb 2020 14:33:44 +0100, Benjamin Gaignard wrote:
> Convert orisetech,otm8009a to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/display/panel/orisetech,otm8009a.txt  | 23 ----------
>  .../bindings/display/panel/orisetech,otm8009a.yaml | 53 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

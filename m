Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF41154E7E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 23:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B9B6FB6D;
	Thu,  6 Feb 2020 22:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F35A6FB6C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 22:02:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y73so161703pfg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 14:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AKy2GPfvS9CgxLQkVubqsZ+Y91Atlf8a7/klYM5O6+k=;
 b=rpi3gszuuEdbjfV8RfoIln94oapkleu0cWQYjRVAKfEzBd/77D2TCuWo7+9K08UsbB
 dQ7LFz3nYJ8g1XG4iLHOW09Fo8yDZ74rX46pIl5pLXZVa2Zfd5sM20iBaBAk1mn6qQLI
 3TGv2NR8KPcBbh7lp9iiIT6JoOo+HBdLDjEJGNARYV7PbbSAbvANx/zaqRTqE1zZu9CR
 01mX5FCQKRvjp9hJvqFQzoIbBwRPFsEUxwUWP6WYfAykIz5kpxoj9b+JpBMNe0aM2ttz
 Yn658U4kANfCXB0wX8jq4YIbZU9SC/++rAcMwccZeibONhPnSSY5YFYeQoEGJwBM/qiw
 fSFg==
X-Gm-Message-State: APjAAAUj/EEL4ZN6tF3tWVGWXlQHd0QGm1e1jIwc4y8JYmreLr1oOWmk
 1MrLIC98rUvr97UmHyoUDA==
X-Google-Smtp-Source: APXvYqz2m/5KnaAfhQtR8QLh7i+VVO2GOuIJv1P44fBKu1hhLSuBxUnTemY6S8EUbWIOGw9Oj/QRjw==
X-Received: by 2002:a62:2a07:: with SMTP id q7mr6263858pfq.153.1581026524104; 
 Thu, 06 Feb 2020 14:02:04 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id z16sm347177pgl.92.2020.02.06.14.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 14:02:03 -0800 (PST)
Received: (nullmailer pid 27083 invoked by uid 1000);
 Thu, 06 Feb 2020 22:02:01 -0000
Date: Thu, 6 Feb 2020 15:02:01 -0700
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: panel: Convert raydium,rm68200 to
 json-schema
Message-ID: <20200206220201.GA27021@bogus>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
 <20200206133344.724-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206133344.724-3-benjamin.gaignard@st.com>
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

On Thu, 6 Feb 2020 14:33:43 +0100, Benjamin Gaignard wrote:
> Convert raydium,rm68200 to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/display/panel/raydium,rm68200.txt     | 25 ----------
>  .../bindings/display/panel/raydium,rm68200.yaml    | 56 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D6933278
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E478810E636;
	Tue, 16 Jul 2024 19:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bg5U1COK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFA910E636
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 19:53:39 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52e96d4986bso6209827e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721159617; x=1721764417; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EpsjAAoGZrYpU/TY4qVGyVfum3ilMYVMKB1jxvuF9Q0=;
 b=bg5U1COKW6K4rYFInmF4E1DIHrBZTXqeplaGYsplmOzJuftSEt0QtVngU2d8u8frK4
 hnmlAiFYTEMPY4ljsZ9DZy8p4kaNKPMQEMwr8UeusorarhLuaB6JebrarOeBAMRH3bCR
 n0dNp45UP5eEuvcdlDISd3r1KcPvOXqHMAO2p1RLdjkwC91Lb+TlF+TdN4sF0vR6c2m/
 ytPfkPIdewbeGocDEzXlCt5ikMh+msPYxdfU2Yu9ec8GhqW86KGc66NHTICKvwRewEWF
 aQoibZv8WwerpdALYZfAcnhv5wUIKpMal8BMMI1bH9dcAiy8FTCVYrFqdtKIwXq4aoSl
 Sh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721159617; x=1721764417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpsjAAoGZrYpU/TY4qVGyVfum3ilMYVMKB1jxvuF9Q0=;
 b=FufiRjzpueSAnFzjHGo/j6iX7JKSsSEiA1ALAnT9u8efQiZNXZ6/ldKhuHImLtGdaR
 VDJzhtk/ug8vK2C6/embfYi+JmJXrPDe8DsP3ZklXlGJkXn/zx17WEGx9ccE15zO3ULN
 DTdEjwpfm0Zx0S55m7jbajrVu6lF3fWsEraJ/gsqwnrunETTPLpcDHhbIx2x1h0NdH0E
 j0v8fTi00s3fOc3AyRPFmBGIB3oLFMwUHvkoyatU8yt892zIfUk6hRwmYNMoh29M8tYd
 s7rpTBetVrSvdKjTuqRSuo5ur8r0nncYY+gY5KB/TK/Oypdwho6NMYEXtOFWPaqjlFMw
 dQaA==
X-Gm-Message-State: AOJu0YywJSmiPDfzq1RZE4+8KqaRq+WpW6MSA9uswkRK28N2Hm9AvkxF
 7YRVyKe0GP6IqS4pDmoIJ1pWGTrDPTng08i5BeTgYfE7DcTid/oEjA2r5QbpJ9U=
X-Google-Smtp-Source: AGHT+IHnQSz/EkRj993UgPzdEe/UnMjP0I0/4EgvVUVDJd3JJdCPlUXe7prr9m+z5n/y9cW/Tb6POg==
X-Received: by 2002:a05:6512:ea6:b0:52c:db4e:8dfc with SMTP id
 2adb3069b0e04-52edf032eb5mr2008506e87.65.1721159617011; 
 Tue, 16 Jul 2024 12:53:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed2532628sm1240504e87.216.2024.07.16.12.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 12:53:36 -0700 (PDT)
Date: Tue, 16 Jul 2024 22:53:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Clayton Craft <clayton@craftyguy.net>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/panel-edp: Add entry for BOE NV133WUM-N63 panel
Message-ID: <mjqx2dpovan4nqcjukzcvquvnpksqkmcl7aumpog7wrsyby3ht@qpqtelwcmrm7>
References: <20240520221836.16031-1-clayton@craftyguy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520221836.16031-1-clayton@craftyguy.net>
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

On Mon, May 20, 2024 at 03:18:36PM GMT, Clayton Craft wrote:
> This panel is found on some laptops e.g., variants of the Thinkpad X13s.
> 
> Signed-off-by: Clayton Craft <clayton@craftyguy.net>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


It had stayed for a while already, I'll pick it up.

-- 
With best wishes
Dmitry

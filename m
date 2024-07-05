Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93E9286C1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B2010EA6A;
	Fri,  5 Jul 2024 10:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yMQKYHQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA44710EA55
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:26:58 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6b5ecafbf88so7309306d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720175217; x=1720780017; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yGbo/J4eUFlKgy2mpmn6Hpr73tNFtSqMvohyWG45viU=;
 b=yMQKYHQiA43l/3vFaiaLo4ZL+lLWhcbFAw6JZUqMD8nXe2121TFDz7Ciy5MIm+MCEq
 gO47cKgDpmC62915todAVii7tLrsnKqgcQyMG7OV7J59pZ19rY1JNGvU7ZL4nnhB4GDG
 Pi/3cD8GhYSltmO/Q0YShQLkyT144JPKuJI8z4S+tH4HFpwXrjcyhqO2MJpPh0YEUegf
 uw57gfuqFxxXzcpd93HtrtjID4yAZ1dHckyLtDF5Q1pauMoUn9Unx4V7Hr2siy22KcLy
 5OTCBDPNQTs2l4WuW3qB7vSyyMCoYxJQStYNOrKPDSmocqGk5e2kGzw/7P9MAtNgrFX3
 L4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720175217; x=1720780017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGbo/J4eUFlKgy2mpmn6Hpr73tNFtSqMvohyWG45viU=;
 b=Go4YBZ0hEQ+gIBsBSN5hHk3zNTiFjTa6RLKh3VavChByxQ9HM5LMTz6hjvGWRhM59P
 LFdJrQr2UU3s5TTTI4LHh+QPbPh9hwDSb/Yk6m8XMzRrCdwlvVe0yitljgId2FglF5UF
 zf7U9VzGK1nt2vfJoKzFfFYdt9fuZSiBVwcQpiXZzwyJyv2yLwj4ihOU2YJOX19smocO
 Wgxcatm3eGkXQ3nDb203C4+nViDcOaYhDWonR/wIRuR/H1AN72+3Rn87wf9aGKxTqynN
 ssqmTOzagUahtunSA/ZyYBxM2bz/n0xREmwMS12SICONvR6gwsUAH9DOfEcCQu1+ys/S
 3P9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGKN0WfKIxL1GTBZrQwXWtbgSbO9O133m48zounRbphSK6G2VJyydcr8JLz1K3m2ZLD4GDRFX4AYM1G1KuekQ8d5i4J3rnYqx14AisG1Cc
X-Gm-Message-State: AOJu0YyVh3BzMX+0QznsWiXra0givr6rkLwLYWsPG/nfEWoeYXlVEyFg
 AK+UnbJTvTm9ivH9XtgIMAsVrkswK7EJt9ujkrD+iS7wOiXFTdC1A0rwJXX4OkA=
X-Google-Smtp-Source: AGHT+IHU8EOVpqYrcQTs3CHIcL+/+yQvLWdVExug/MFZEndiHTAoPACMoBY2RZmg3CFNlc85aj2geQ==
X-Received: by 2002:a05:6214:5013:b0:6b5:4b10:7849 with SMTP id
 6a1803df08f44-6b5ecfb53f2mr47314046d6.1.1720175217387; 
 Fri, 05 Jul 2024 03:26:57 -0700 (PDT)
Received: from aspen.lan ([185.80.132.160]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b5f47b8260sm6893286d6.100.2024.07.05.03.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:26:56 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:26:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: l4f00242t03: Add check for spi_setup
Message-ID: <20240705102653.GB110803@aspen.lan>
References: <20240705092800.3221159-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705092800.3221159-1-nichen@iscas.ac.cn>
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

On Fri, Jul 05, 2024 at 05:28:00PM +0800, Chen Ni wrote:
> Add check for the return value of spi_setup() and return the error
> if it fails in order to catch the error.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

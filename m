Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DBC5637E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 09:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCA010E5F9;
	Thu, 13 Nov 2025 08:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mW68RaEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AD710E5EE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 08:21:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7ade456b6abso420555b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 00:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763022074; x=1763626874; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L7rrq4WiKIi6GSN+aCQUJaSUVAJ38fs+p26mjrNBcqA=;
 b=mW68RaEqh8jGmyV65V576mlBf1m2y+C03LwzqKIX9eLalaXDP3CK5qkfFAi6Jdg25R
 Pb29NBczEuLW/7k1XjrD/qSeWkwdTeKw0yyo8aS/wASU2lRAGNRl0EBBRPNxqWMa0AMs
 l4MQc61oJFZ2EACxhPKbD/ZZw0OXx0lMNXBUMW4gtK02lM497rga408v01HFC0KXB6SJ
 wRZ7uSClmt+kiXImJedPsB31LGuNEJancMbFl1LkLfvaTR/W3Ue8+6I0OkD4ekObtJEQ
 DBU6+23v/Cp7Vz2jFj88xGk6+NYCMkDV3I2rpikTMb4nRAvJTpo8/o72pU6qPTZZVOHe
 c6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763022074; x=1763626874;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7rrq4WiKIi6GSN+aCQUJaSUVAJ38fs+p26mjrNBcqA=;
 b=Fe/VObMin86SzPEsabj/dYD7VsWOJVSq+R8EC2uWhWQdhQ4pTlYpG3bD3/tfHFtmEJ
 CcCH7iOIb9KOtDEr15+kE3fecr4hw5CCkz5R46uhMUAomceE1BO8+pSJTmJpe+if5F72
 facVGWz/ATbG56IAJ2dRDjLW/mWkZpD1p06/U/dqPl6hHL+0Q+reyfv/GEL1PwkojHIW
 P+z3IJ/lzyaU8ewVZ4ZZ4wfz7UqvL0lEgdHKW4wlqX2no2bUJJt1a5guPwHqQFazVtjt
 NrG5096XX6X+IJCuBkKR70FvAK7FGQk5DFt7t6n6ItNtZegqP0OfcGGr2ymlBRetZY7k
 nrIA==
X-Gm-Message-State: AOJu0Ywg73XqTSAMa8SRlms3RNTaVBB19gwibu9k/gVacqwQvYm4NDyE
 /yauzBFdASxv7dW4VNtfcSaH212sS/RMmPRn81JKKdaIqOVUp392YT8kK4Ir3w==
X-Gm-Gg: ASbGnct3rTiO6NC4Fey6f6qhR3zZ6kHwhf2S6ArzqWRAIkqaMPE1J+nupU+bvtCHrA7
 FUR0WLOVv3rLBqeptyAP9XNnAY6Wl6XpEgdT9fItVDLGs8HK5zGOEtchb1ko9Npw6MJDRcJwVcl
 GylnS7+P8VYKlNTVoKL6NWzDFjvbxRXQ4MvDnF2yTXKpObEg8eyAdxkekjAKxc9EvmXQ0lfggI3
 /OJT5gq8nho6nqeoauegPmzKAnfsoXTC6dYhL29s4HwOYp9W4DirY29kRf+MnoNtnii8AkN9pYM
 ZxfB03Xpq7JmlU30QgRcIn6SX2msrw8rhmU6CtYU/JCXwjX+BhS70UjYxLaj56mN/5J+TUCV1+O
 XuCz1lW9F8fLA2kiz2CFD4Pafq0hdb89tcMW080cmDrOskzX5TdfuLGZpXYFqatXU1dooFHn8BF
 M1M80=
X-Google-Smtp-Source: AGHT+IFysTHUjNEuPh00MCrJEYLnKEdmVnsQMMpHldxJQNuHD1tNj4Av6uMadzQrVRooBE7mHyl74w==
X-Received: by 2002:a05:6a00:4d03:b0:7b9:a27:3516 with SMTP id
 d2e1a72fcca58-7b90a2738a5mr1716653b3a.21.1763022073646; 
 Thu, 13 Nov 2025 00:21:13 -0800 (PST)
Received: from essd ([103.158.43.16]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b927c230aesm1431467b3a.68.2025.11.13.00.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 00:21:13 -0800 (PST)
Date: Thu, 13 Nov 2025 13:51:07 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jianglei Nie <niejianglei2021@163.com>
Subject: Re: [PATCH v2 1/1] staging: fbtft: core: fix potential memory leak
 in fbtft_probe_common()
Message-ID: <zvkfqrnqwksg5otoy2wzfx2xtmcyyk2fgottnqkkwm6q2uxdam@2fthfckoffov>
References: <20251112192235.2088654-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112192235.2088654-1-andriy.shevchenko@linux.intel.com>
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

Looks good to me.
Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>

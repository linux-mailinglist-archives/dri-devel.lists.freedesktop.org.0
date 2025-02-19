Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B79A3C997
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E7A10E891;
	Wed, 19 Feb 2025 20:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PxOCFc/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B934310E88E;
 Wed, 19 Feb 2025 20:23:49 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so2479198a12.1; 
 Wed, 19 Feb 2025 12:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739996628; x=1740601428; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8C9FDgpCO5k/lG9CyZPK4deI/6T7YtN9NRCiQlWA9Hs=;
 b=PxOCFc/wti7SOGhC4B37qldQK8xfqwKlYteRzrZVeD3M5kIA4/YT/wdVyLfYZK7SY/
 oGJUJImIpkj54EJeheYRE12cCUR7VWcW/ckmC8pvC2RQ1mg8XyD9PeG3rPURRKXua01t
 mqX99r+ZqoHcvsYvFdAaCr2Jk+Wbhy9T6j69Uno9jarU3StqUWP3dQsjFGP/Sfe3CDL1
 kO1JFlSPUU5nnfDMbrpVGaxeoSo0BA1av+isccBVW+8wdxTZrNFhcXpKiI2kyXX24Vo8
 9kcsQmmFuenU9HBWUqoQM60q+8A1/1OlutxuabF2OeAFUCJAfICFpV6WSlczYIr7msXe
 4qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739996628; x=1740601428;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8C9FDgpCO5k/lG9CyZPK4deI/6T7YtN9NRCiQlWA9Hs=;
 b=VPcgCkJIShvVo1BAYnIqKR57qe5W7CbV/ereKWBuD+tDyQsLfgKGXdVlNDzrf0dFUm
 Dlvwtl+NF5CPCv+kOYf/UPUfOuhsMzS4I3ALwsG5NwMpnDuRh2MqZtIBX+VHlQsIemH/
 +x+i8c+f2Dd2FHWp6WF21b89AHL9Wd5k9EFZ51j3+pquyZHf5Kv9Hl3UAIEeVDp1v8LT
 PNoh0p9YAIKjzsBFTNdmXGe3AYgzR8GyQwfl3YBi0Tq2Y7un4uiGy229LEU1BdLWQbl9
 1N88ergDd6hvcyv66GSnT0M6XPo9TI0nxv8aZEiobCxRX/K1YxjSwxiLHPOpmXnByJnh
 nyDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwSA0ko48s6tpkqh7JBbOUq4/J77uAGU43n/+U0bWiBB0lKwcicSiQljPpQHLTyh7xcwtm0TixZmQ=@lists.freedesktop.org,
 AJvYcCWU5+O84r0xYBLHcYABWg84j8vq607pZcO9ijHg6OqUu0B+P5J0o6LflnpKJODLGbAWrszGIaQfEA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxHdSSr1j8iwMT29RIRhw4hhBRz9NBLq/MQjVPzM7VjnT7gN70
 q+uYCGvJm0d0YcsjhCvN1/dMPH4pd+ESINaq7/vMj1IZ99LG/vSHY9evVeD41iCY/ZWstgzXcnj
 EmkfX+kZeyCh2SNx59oJsG8ExRaU=
X-Gm-Gg: ASbGncuX8bQ8TPNslUgC5IsnQ+MMoCIdO9cBp9El+SEMJpxdS3PM1ooUiHZPOsZYph4
 AMlNJEx+082g7sqp1FpNsZmizzsWw3MVC/n3DYPztLGgN3q4ujOlOA76Vlv6GQwCexEaLG28=
X-Google-Smtp-Source: AGHT+IFTlPvg9QQaaWG38k9pWnqwqUxFI4TWfr84YWgQa8VYHZrfD/59IaIQj2pDGyJZK0qQXwPO63XKwpHnAgwuThw=
X-Received: by 2002:a17:907:770b:b0:ab7:b7b5:2a0c with SMTP id
 a640c23a62f3a-abbedd2f416mr55624866b.6.1739996627857; Wed, 19 Feb 2025
 12:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
 <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
 <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
 <fd920faf-a707-4c6d-8c0b-3d59c010da1d@nvidia.com>
In-Reply-To: <fd920faf-a707-4c6d-8c0b-3d59c010da1d@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 20 Feb 2025 06:23:36 +1000
X-Gm-Features: AWEUYZkOfBGae_62O2RzZAhPDqSPHCfH2IsqaSVq-HA6ddj2SAfSDh8cunMZ-t0
Message-ID: <CAPM=9txmQWO+SHnZhr8zXHCZ=S8CNY=PryRVkWWuHyor-ajU6A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 20 Feb 2025 at 06:22, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2/19/25 4:51 AM, Alexandre Courbot wrote:
> > Yes, that looks like the optimal way to do this actually. It also
> > doesn't introduce any overhead as the destructuring was doing both
> > high_half() and low_half() in sequence, so in some cases it might
> > even be more efficient.
> >
> > I'd just like to find a better naming. high() and low() might be enough?
> > Or are there other suggestions?
> >
>
> Maybe use "32" instead of "half":
>
>      .high_32()  / .low_32()
>      .upper_32() / .lower_32()
>

The C code currently does upper_32_bits and lower_32_bits, do we want
to align or diverge here?

Dave.

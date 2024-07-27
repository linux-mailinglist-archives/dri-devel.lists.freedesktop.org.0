Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7C93E053
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 19:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A78910E061;
	Sat, 27 Jul 2024 17:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i85ZDk/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687C910E061
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 17:26:09 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-44ff99fcd42so9179731cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 10:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722101168; x=1722705968; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9mXEidSCbTxCEMvjRmFfWopU+ZWCaSmREcQ6uNlzUY8=;
 b=i85ZDk/1n6IueRnTpTyDNCzdWbByR/8AW4xnU7ohWYkx+6NNsnG8j9bV3s5V24Sb1L
 ZyqIUarqWDIfY49uVmBdrn58VzAkDKqBViRKIWM5hvr8165F5OR1gj1AaSBuRRxp31X3
 GOsgm/v0/7eN5WJqs+TePabafmyc3bxDpxWiD0hQHFBNuuVwUmbL4oURYvmHIYuT/pd/
 xa+6K5XNqhRONJa99mfGo5m5n2XEx0qi0b4autr5sOZWcnRAP07QhizUnHgGuDo3mxMG
 nxkvNv585fps4skmprYE6ps5sjCthVXIrF/UnUuAExTZgqiPK8Taq1ZKrrnP5gB82f0M
 eZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722101168; x=1722705968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mXEidSCbTxCEMvjRmFfWopU+ZWCaSmREcQ6uNlzUY8=;
 b=kxuJ2y/vjzCXGKfWH80Qlrk6hT95nal7IbIzre4BP/hCNcGGU/ayJs9y5FHTam1aa5
 /YTXT7wvqdbUkMnvZVjtQ+MT3YP3zpdrFCkY61MuGib0b9W9VXzY37cWLIKUgUTU+4/n
 Ox1LbL+Uv/X2o7Ij6SoqpsXX5Vy3XzMIVcuHRhgmUb17TCxopYfocrgPEmlsP/It6Bk3
 lVMx2nKzt8P/q7rybwcaYkR0VB5sLfOMlciicBw5eTsQypbH+AKTR7hJVmPOHsOLFv5K
 OX+im3YCMksA26+HiJarF0WKu21vRqZ+KFwGtO/b/VNZVk02EKLyUi3BVtdPdOgq5WfM
 zbDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVkX1ihFHIMP4QFVkc8h8ZzO+QU17695sVFOJYH2dAW89FJfs1hpInWuhLL5sCTeuoCBeCAkCHf+DebfdnlAFL586hgilZQ0TedKTfn4W5
X-Gm-Message-State: AOJu0YyunNdvrne1U4hyqCl8/YWBEeH+fsFYbN4+z3d/ORwS1QeZoiR9
 vIzcmdX9dndFVZJTpR061whOuAXb2Rka8qm9n3MBefThxoh67kJi
X-Google-Smtp-Source: AGHT+IHZmTWCYaCpj+GEFbm8JxA2Vfn8GpH4Olgk26FftL3v9YKmgGnC9zttm9v5+DghGzE9vJ1fwA==
X-Received: by 2002:a05:622a:447:b0:447:d867:2aa7 with SMTP id
 d75a77b69052e-45004f3dba3mr38418051cf.46.1722101168180; 
 Sat, 27 Jul 2024 10:26:08 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8123516sm25656831cf.1.2024.07.27.10.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 10:26:07 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:26:05 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, christophe.jaillet@wanadoo.fr, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add driver for Sharp Memory LCD
Message-ID: <crnz3y3y3m4yjrovjamtlftmztmqejqx6s2jg33guhkt2slnvl@45cfsfia3pyi>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-1-lanzano.alex@gmail.com>
 <a814e348-9837-4cfa-a500-72f47b47c9b7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a814e348-9837-4cfa-a500-72f47b47c9b7@kernel.org>
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

On Sat, Jul 27, 2024 at 11:00:08AM GMT, Krzysztof Kozlowski wrote:
> On 26/07/2024 21:44, Alex Lanzano wrote:
> > This patch series add support for the monochrome Sharp Memory LCD
> > panels. This series is based off of the work done by Mehdi Djait.
> > 
> > References:
> > https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> > https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.
> 
> Best regards,
> Krzysztof
> 

Will do! Sorry about that

Best regards,
Alex

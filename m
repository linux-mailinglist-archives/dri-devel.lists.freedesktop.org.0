Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1D1F137B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9906E484;
	Mon,  8 Jun 2020 07:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417CB6E45E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 04:30:19 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d27so13702438qtg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=bZmtb3aLVU5KBGiqZAaqclMmQhVOzE13zZD4uF6ANrY=;
 b=gaLhUKP8dFKwFLkiRjCjiuudl522MbjPdmUimfzDCN3xnE1XdHEG6E0esOcvPDeQ9W
 Do49PqQzw0fpkjLZtP3c84sxg7kHFlVatQT5APvfHMJ/VS/jKh7khzHCcUqjjaEf5QyK
 /ASt7MgK0qf4GaCCsRWS1ge6qGcCncJuVDZvfD/xUdaESyjFAWj5umOGjBW/spz+TVFy
 UkIGyTDnnEJjGLRu/cdmVbxYcKSgR/HU3gKvvtwoURh00dxiyFSlOOXJwrgxcFOPPoJj
 evNkW/2eiAPgLD+z64pWm8y3enKoeBiR+Cm9B8kg9uNAf38m12IPO8IMRO46Yv6eqYzN
 upGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=bZmtb3aLVU5KBGiqZAaqclMmQhVOzE13zZD4uF6ANrY=;
 b=FGs3TZfX2pjvgvMOJXnbPB87gQfPyQJ9t4mdrqktZKYQ73Vg4UdZN6y2Qs7w/mXEzr
 OjbxZk7zIXK5k87AHFOid2jA1UdpRB4I7aIQ+iYVrZRLZx/sVJXaL7ICIoOnRnYfenqP
 D2ijXVq1nSNlggXf3wN8xVFR0fyb+cZ6OVbcqln3QBM113Pa3oZI7XNYWPtKR+2y0nKC
 WKPUFx6gELlS0Ra4g4swyLPGmx2HR8g+FnHkwlNJ/NCVkFdmiVpC9UdZDxyraP527OeZ
 TrhDFY6geRqbYmQXL0/HsFUTOndmO6ga+ifg0/JChqaLQDRgxao+5uwucBOD/equIk3D
 PdNw==
X-Gm-Message-State: AOAM532IlMP5uTbmN16LJRMOpbq5QuTgpAAQD7QWxcH9fJv1PrY1bf7t
 NtDp7k4eFa4wGEEVDfIvDYc1IH6SSh8r9w==
X-Google-Smtp-Source: ABdhPJxRJE6Dl9jcPCtME9UeFyPzJdE0BYbCiwXVxxXS+YuRUIFTS2CzbpJT/kxkF6tJMislX6p2iQ==
X-Received: by 2002:ac8:688a:: with SMTP id m10mr14265007qtq.254.1591590618119; 
 Sun, 07 Jun 2020 21:30:18 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id u7sm6256233qkb.7.2020.06.07.21.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jun 2020 21:30:17 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date: Mon, 8 Jun 2020 00:30:16 -0400
Message-Id: <1DA4E5B7-BB3A-476B-B09A-24EC89583C3D@lca.pw>
References: <20200608031622.GQ22208@pendragon.ideasonboard.com>
In-Reply-To: <20200608031622.GQ22208@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: iPhone Mail (17F80)
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Jun 7, 2020, at 11:16 PM, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> I forgot to mention, I think the subject line should be
> 
> drm/rcar-du: Make DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU
> 
> Could you please let me know if you're OK with these two small changes ?

Yes, I am fine with those.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

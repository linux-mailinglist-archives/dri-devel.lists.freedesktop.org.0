Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF2629423
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ED810E38E;
	Tue, 15 Nov 2022 09:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5D10E38E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 09:18:17 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u2so16697780ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 01:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qaitHJH1+HQ8p61NgJ/vK7sYaS5lBIaT79O+RvQ2OXY=;
 b=LyPPwARTu0tlJXhl/BVeknR9SCniGkuacWgUyj07k8GOzP3SVMTSYPytcEMXri9NaX
 fSjEQnT5j3WXbBuR+POiwPFioUjeFv7AIJTuECWDBgSxZ3d27icDW+WFothueik/1fq5
 b0fxqF+dfUAF8PmPrXobJXikLrS7dNCMRSuDDSb3LbXdwOmcsAdH2J6wqO/sFWNUHU4w
 shP91K96ejD8k6ztFaIUi0voO6U3LukQKrlA6TnmAva/L4VAgJ9TSNCCzHhcKhuiQ26h
 aG1LInlkbsMeYrgNjOIrGmc7glpWYe7MtIoViLrMms0zDUE86tLivEwG1mZ/2p0ooEOu
 ge0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qaitHJH1+HQ8p61NgJ/vK7sYaS5lBIaT79O+RvQ2OXY=;
 b=4RLe3QjGlUIyJOzPMgG2J1xMPXFCPEofL4y6mZJvxedC+JwVaMj2g72cYlNJnT3KzM
 b7opgYvCykJc2tSq0E1DPWqqsJmLaR5tmTcqKxYfvTy2wM+Kdc5pUxPwLA/1iFc+9yvC
 fcLlxU9Y+SaHtZR1BCNW8oBQIBOiP0bDJ9DYveLe5Wkm0wLPSXgy/iU/x8ZL/lvqefzK
 N/tR5V69eQ2Hwu6A8b8LdPM++Q9bNCxyce/tKjOFLqEt2NHrF7L75of7H99szbJ+DyNj
 g7mZViPqj+Z733njsFpQEG6OXf5UT4ttJAiZd1rvPGB3BHNVmdUW3hJWuvLeoLAuhNmG
 Bdcw==
X-Gm-Message-State: ANoB5pmmaqLKErhoCPj6YA6eml5NghpmYnO3HaJnwtuij+5qzN9nGGeN
 Ew3w9l4cCQ4Hnm3PYkrhzWF6/89cmBU=
X-Google-Smtp-Source: AA0mqf65Dw7flQneldyaF6rMAs/W92zoRxN/Ls9WEY0Skp1Y4usRiRrcGJdYS9VhhQjyu6WUiK9obA==
X-Received: by 2002:a2e:bf1c:0:b0:278:ea67:a38c with SMTP id
 c28-20020a2ebf1c000000b00278ea67a38cmr4911226ljr.63.1668503895382; 
 Tue, 15 Nov 2022 01:18:15 -0800 (PST)
Received: from gmail.com (host-95-193-110-185.mobileonline.telia.com.
 [95.193.110.185]) by smtp.gmail.com with ESMTPSA id
 y1-20020ac24201000000b004a44ffb1023sm2153710lfh.57.2022.11.15.01.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 01:18:14 -0800 (PST)
Date: Tue, 15 Nov 2022 10:18:12 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Y3NZVGxtxpQzlXYc@gmail.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <Y3NTFY9Dz7eB9Uho@gmail.com>
 <Eeerr6sqPNtw7uDqaovP1hJxjfKeDT3dWUY6vT0NpTJnA7bWHEdfnk7Vu7nDNKbK3OCBr-s3bTq1-acc9vGQ1vnGXTXxSCjwXteN7E7GGWY=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Eeerr6sqPNtw7uDqaovP1hJxjfKeDT3dWUY6vT0NpTJnA7bWHEdfnk7Vu7nDNKbK3OCBr-s3bTq1-acc9vGQ1vnGXTXxSCjwXteN7E7GGWY=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 08:55:12AM +0000, Simon Ser wrote:
> I've already pushed both patches to drm-misc-next.

It's not in any 6.1 rc yet, and apparently it needs to be pushed to
drm-misc-fixes to get into 6.1.

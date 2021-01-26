Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37843055A3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724C26E5B4;
	Wed, 27 Jan 2021 08:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5655489C37
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 12:45:05 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id e9so9724807plh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 04:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=9a81CG4SHOE28Bf8JJ1zvGq039y62JTzwIy7vae083Y=;
 b=ky0kWgI1LhXYaXsAmJ3DPyuoBYZMViZexpYgH+lpR2fKLFGoegxnu9/k3rbGHODZyk
 Yr14jWtSXW7v5rStY+WOtp92vmAz+CqAlEcMBJxOQ9Bc6GjQbc/+4kUd9iNE3tLWEb3G
 VVlFyl4iftXuDICb/Gg9Sz8lFN1hxhWZwgHLDGw4Kl7N1RZIdUSdtG+fu7ds1ah1OwVi
 djgCyNSy9SP1y1FVl7T9/TstnplOWbfR7P4Uo2pgV1Orns/GptBAzM512RQAnKJKaXHw
 9LEHAGFBou2Fk8FhC4h+8/uYPOP3zBGt00OV3ir+5PbX0F3vwhq2/pUDGfd/nU7lAA3i
 hOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=9a81CG4SHOE28Bf8JJ1zvGq039y62JTzwIy7vae083Y=;
 b=dBxRgEt+2E9T+POa8A/XAUwi/I2WeJwqN0JcA79mYkhZW0Qu8nfqJiVBwHHZt5Ny5D
 3IrklR4RgsZAIlk0P4PfaWuDrthszn92e8s7gYczw6JbRaX9g+Wiri4R0jaRv/hGZfoR
 CMh5L5btxohduRXginqb7KF34Kgcc4S0Tzcf7HpxlHEVK/BkAN2k9tLOmunoN2oj4mJa
 H9pTZj2dOG8+Y12Iitu92rawk4Fc8OL+L5/KoxIbg3JDe3eSfPMjra45aQ946knSifsR
 ClBkjnQza8hzeZwd2fKXn5K+CHNvOGV/6VqTlq1updPZYGLEJ2fes55Kv9VBHHB53lII
 fEXw==
X-Gm-Message-State: AOAM532iYc/HuEpTJoFCnIKCIOCJcLAsbgFTZMfuLTikU0yA+zzBZpQ4
 tYLQst4OWXuEOJa97bBfZnY=
X-Google-Smtp-Source: ABdhPJxiCb7QZ0TikxQ7E5YkT7Pg9cG8f+dof/LTW/qDOqRE5N2oICgGiXNuVElqx4NoD4DJGnZazg==
X-Received: by 2002:a17:90b:fd3:: with SMTP id
 gd19mr6134207pjb.129.1611665105027; 
 Tue, 26 Jan 2021 04:45:05 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id b203sm19214968pfb.11.2021.01.26.04.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 04:45:04 -0800 (PST)
Date: Tue, 26 Jan 2021 20:44:59 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] fbtft: add tearing signal detect
Message-ID: <20210126204459.00002b7e@gmail.com>
In-Reply-To: <20210126081745.GX2696@kadam>
References: <1611564252-84205-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210126081745.GX2696@kadam>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, gregkh@linuxfoundation.org,
 oliver.graute@kococonnector.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sbrivio@redhat.com, colin.king@canonical.com,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Jan 2021 11:17:45 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Mon, Jan 25, 2021 at 04:44:12PM +0800, Carlis wrote:
> > From: "carlis.zhang_cp" <zhangxuezhi1@yulong.com>  
> 
> I was really expecting that you would fix this and Signed-off-by as
> well.
> 
> regards,
> dan carpenter
> 
I have fix this in patch v3
> regards,
> zhangxuezhi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

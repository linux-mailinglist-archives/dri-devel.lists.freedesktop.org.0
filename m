Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C1B8878B8
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 13:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DD310F689;
	Sat, 23 Mar 2024 12:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="OU9vyCZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4710FB57
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 06:17:12 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-430b74c17aaso21047811cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 23:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1711174631; x=1711779431;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YUD52ht+HR3l3eedQqUGqKmwp+yFV4q4zkif3Vs2Vr0=;
 b=OU9vyCZBo4u1aX2wCXXwkQjT3NhTv0TDZ805WQlIjewpGLXfJ1G097ddq8irqxJESf
 b+ShSQvzJIkc23M/TJBS1fKh/8yjgg5r0EToM7xoqJPf/XJMUR34Ff3MDi/xHanLtgIW
 TxqsHFtgaSXP4KbewIFpTVEI/FGYR+A70zWeUs/UT8EpbtZ62JnBTblvOeyMzfpNUGiZ
 NTKoA6HtVZaQZKaXJTRYiTSs91jaknUs6o8mAr6z9vMIau1B3vxlTDYWWu1Ny7PtLfYl
 jIlSxkgCPPsTEkWObtpfb6WBPTiUnNSnxNdJ5xq3p9CTnnoQhniNDd90AOJ3zb9OnkBF
 h04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711174631; x=1711779431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUD52ht+HR3l3eedQqUGqKmwp+yFV4q4zkif3Vs2Vr0=;
 b=P4JDDVf0HmHacpnX/dBzmtlAWqeZFheqXmcCkRFmylhhOJFC81ie2RewAMkeQ3LFEK
 gDAvi7cRM+ND6r9J2BEN1g8VMfLsO2PfAL5PMVsZNZ5iErmofuW6YL9Qu7v8oUOmswXs
 EzNGFQasuwvz4uRElLJvYZQPyTW6X8QmChIxfJoY5YOknve75JLbcVLiWuYAhApnm0vT
 y0xq6CjdebiUPTNMX4XcttoXD4WegQKmTWUgVOcdAReaPGFLWOk8m5/N2GEoIaYf6aJY
 +ZnoY12MU7iA+M1bnueBA2DZbGlI1/he3Aiov/2RGGMRJN4MPQ4WJ+l7/ry00+9nWlrQ
 fsTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdPpmr3dth0LWm+SzSrzoZnzZLuX7pm7BVYVZreyDhHWPKlI3/vFjwB57t0M3FGXJxTYVAAy4HTwsB8rHgazI5Esk5GjAhVbkImAxZnLHj
X-Gm-Message-State: AOJu0YyAitw+jgWouMeVCS+SLLuUt7+/NzM9Ts4rHtsxMwhGr6MDVkwM
 qEsrJ1FsT5wI4I3zp8bXvFklqx/cI8Ucwijnx2JKiSuqb9UuX6czWWehCIFW0bk=
X-Google-Smtp-Source: AGHT+IHsW+rCkfYvisR1ygy31z8BZc9G7J8m+4nL2/pwwjaGvRY/EyVRR4S6gmRAATdetLzbqae2KA==
X-Received: by 2002:ac8:7c47:0:b0:431:458a:8ea5 with SMTP id
 o7-20020ac87c47000000b00431458a8ea5mr220141qtv.55.1711174631036; 
 Fri, 22 Mar 2024 23:17:11 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca.
 [24.53.241.2]) by smtp.gmail.com with ESMTPSA id
 bb40-20020a05622a1b2800b00431435c34b1sm196691qtb.60.2024.03.22.23.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 23:17:10 -0700 (PDT)
Message-ID: <25ecf18b-7533-410a-9b1f-6c11343b8565@draconx.ca>
Date: Sat, 23 Mar 2024 02:17:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Select I/O-memory framebuffer ops for SBus
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, stable@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de
References: <20240322083005.24269-1-tzimmermann@suse.de>
 <877chu1r8s.fsf@minerva.mail-host-address-is-not-set>
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <877chu1r8s.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 23 Mar 2024 12:53:03 +0000
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

On 2024-03-22 06:43, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> 
>> Framebuffer I/O on the Sparc Sbus requires read/write helpers for
>> I/O memory. Select FB_IOMEM_FOPS accordingly.
>>
>> Reported-by: Nick Bowler <nbowler@draconx.ca>

Applied on top of 6.8 and the build is successful.

Thanks,
  Nick

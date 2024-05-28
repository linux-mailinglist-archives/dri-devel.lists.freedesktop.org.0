Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753928D1A68
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934FC10FD1F;
	Tue, 28 May 2024 11:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DYsueU+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE80210E862
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:11:34 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5755fafa5a7so556259a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716880293; x=1717485093; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kjW/OwKE/38nsTgfKPv6P/u0Ov0EctGEAhg2D4hqOUo=;
 b=DYsueU+TIaNyFgIs8GIBKGOUuyuIFATNzIpLrp6rWN+Epcck4++Vb/+mDtxYRMCgig
 c+idY8RPW7ystGcsxtb8zj2A/wBXQW54qo1oDcyDM//HB81rlt/YSB00zibN0FeFxtL8
 Jyky9ECzc+h0bIAntJckkm9EXcgBlH/MJjlXBhnEhoKFtWjFrI3wVIn+gbxNe4TuKIhd
 9tKYXlqs/wy3A27byRnO9UGWLH7tm0VkMMZMRA7QzyHr4mmU48GEfDPjDGO6VqKW1BFD
 J/GzCdStQZoBQlyrMFYkS4R4FcTSv32ub5vizxF6luwoIeWaLlGI1rn2CwD/u0/idTpD
 a+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716880293; x=1717485093;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kjW/OwKE/38nsTgfKPv6P/u0Ov0EctGEAhg2D4hqOUo=;
 b=OPwMa3aVk9WYQYTBBORfKHNjM9rOfcglfXSKmIkd++ZeGaghHB3YDOzl7gqBZTuKP0
 vcH2X8EI1gy4rrdAtB35A0Me4uB0XqZKm+JSaI6p5Xg/XuqJDHyZ6PxxdTx+K4SPqEhY
 flwAmr0UEVff7rCkU0iBmYb3VNbR58Akv/YK8OArPgWkeravkxruUR1oszZG6B1D9+dN
 X9LweenQwCeJKwuJ3q1nOU0nQ4ZXY6pFKE/HVMNSbzz6T9TCki1f2/LNtx0DQzolD6i3
 dDuwFJ2Za9TbLLpjmM7SNtyUNsT4avK70HEPmewJ9v3dRdieqfYxyFux82bi8282s3BV
 GXbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVStbF7UHgODFIL6IJB+2V61oCcJdFP3aZKQij9uFAfNP8FqckznQZiHuOdPxpu5ZCtqIL+Btbo2EWAhYlIxYVktRoVNQUvVPW3jq9RsqGP
X-Gm-Message-State: AOJu0YzJrhEHJaT/h6jIi9WZimoKgZeiaIL7E1iK1EQDOKqhhYVKSzPq
 XRVqyzAGDmjorcLqanh0XiM/PcM5FpJWjOQYKqctutIjOq32IUDWrw3iUU7vjgs0AeSGlQCFvAR
 E/0N4Lsbk6ypC0tQV4eRpdtqoT8E=
X-Google-Smtp-Source: AGHT+IH6+hTIoQBFFbTeS0YuEp2GoR1v36rnyQ70PtF5/UbceQS4J5FbAFcmhigUp4V1HyL5pHs4p38fkMsqsZBen0I=
X-Received: by 2002:a50:870d:0:b0:573:5c1c:4f5e with SMTP id
 4fb4d7f45d1cf-578517a4197mr6439347a12.0.1716880292825; Tue, 28 May 2024
 00:11:32 -0700 (PDT)
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Tue, 28 May 2024 09:11:21 +0200
Message-ID: <CADomA4-gOq+76qCySyiQ=FEmnEb6O4N86hgc7sJjGxbDfSXU4w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add WL-355608-A8 panel
To: ryan@testtoast.com
Cc: airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kikuchan98@gmail.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 macroalpha82@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, robh@kernel.org, sam@ravnborg.org, 
 tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 28 May 2024 11:57:26 +0000
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

Tested on my RG35XX-H, no issues

Tested-by: Philippe Simons <simons.philippe@gmail.com>

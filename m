Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324AD76AABD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C009010E324;
	Tue,  1 Aug 2023 08:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CF910E2CE
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:28:16 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bb775625e2so30074935ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690820896; x=1691425696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4h7lSNE73lj0ioWSGlzMCJus9tMgkN5ZlR6+RtZDGzA=;
 b=GYf6wrsH4RBCnRKEyaSJXyu6M/eFU0AqSzSetvo526HOrkihNr9WhcMPEHzdvEocEs
 hHdzbIfZVcVmk0XmlVJ3iqydGcYMVWp4ASzw3JI1j4f1lDgeOfFgWZUr+lvMKxL85NRh
 2JiO5EI5XU+l/EaR9sZnW2zOFVhq3sv5OkcNko+Naqreg6UcUOX+ye5EpUjQGMlAbeXk
 A920b7aqMN9RgMDWR9PkwwtE7lldQ4mzlwKWo/+fV5QbdvPQWS5XP50Mx+rWiu9Zdj77
 hjAmSr3eNzeq16D3d4ft1EWjs3FSIjBw1THJetHIWpoBWlA7Qk1T1wAZ5X2wbjJnp1/G
 Q+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690820896; x=1691425696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4h7lSNE73lj0ioWSGlzMCJus9tMgkN5ZlR6+RtZDGzA=;
 b=IYW2P712prTwWWemUX01UABNzrBFLLZytXWZh7GYrRf0zo7F50as8M5WTSYztbrzBc
 rFNjVth5Qv4LPXDzrw1uXmdmwtiSdeloxzKOTqcO4nG2H3eHMQBbE84DcV5YEFeUBcob
 GyARpXZ3OmRxlcbnTKN3FYEiXYD3S4O2KiBPNrOplmjSEYU0AnhyDOMd7yc4acdCmIsm
 1CXkEX/imXJYqk4DrAmwziCNROj6GTxlwzVWQ4rhJpWWjjyfvC7kbh225D0gZkTvY+iX
 7DCl+2t07El6ca8k1PFRKF701EmMKOVlQogDEnbL8O5Arh4qsbJq7POBmfTxXgrWsScG
 I2YQ==
X-Gm-Message-State: ABy/qLZ29rCUdusdVFp0KNaR1rZ+hRHaeekWNZLQiSTIVnM83Z/37e9P
 tVpEEVRP6Tfy+UODcf+pDXs=
X-Google-Smtp-Source: APBJJlEPCe0AQA/D7GKT1NLPzJ+LI5ZLrQPWugkbBuVJTmpTScfwhh8Xreqv+n8ydHmbCelB+Pw6WQ==
X-Received: by 2002:a17:902:6504:b0:1bc:224a:45c2 with SMTP id
 b4-20020a170902650400b001bc224a45c2mr301722plk.15.1690820895765; 
 Mon, 31 Jul 2023 09:28:15 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-73-13.dynamic-ip.hinet.net.
 [36.228.73.13]) by smtp.gmail.com with ESMTPSA id
 g22-20020a1709029f9600b001b8b73da7b1sm8796117plq.227.2023.07.31.09.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 09:28:15 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: deller@gmx.de
Subject: Re: [PATCH] fbdev: fbmem: mark registered_fb static
Date: Tue,  1 Aug 2023 00:28:12 +0800
Message-Id: <20230731162812.25518-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0cb2ab66-ca30-b2ab-47f7-04208b2400cd@gmx.de>
References: <0cb2ab66-ca30-b2ab-47f7-04208b2400cd@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Aug 2023 08:18:42 +0000
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
Cc: linux-fbdev@vger.kernel.org, minhuadotchen@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Helge,

>num_registered_fb is still used in:
>drivers/staging/olpc_dcon/olpc_dcon.c:  if (num_registered_fb < 1) {
>
>Helge

Thanks, you're right, num_registered_fb is still being used.
I'll check this patch and submit v2.

thanks,
Min-Hua

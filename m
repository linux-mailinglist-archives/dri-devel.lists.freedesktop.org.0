Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E322EEED3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCBE6E7E5;
	Fri,  8 Jan 2021 08:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86E489BFB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 15:35:17 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id q4so3722091plr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 07:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=WOA/lkT1Penwdm7gXlUndjIxo8Lg3413qdHlpeu3jD7BYjhN1LZim/MO+fJhP8iclc
 N51f6I4W5xKMGU+bVSaI762UmMNKQcI6cAe4TnkwmyNTt9yzgXAoezYKDLqBMcI9CNH0
 B5aIGN85xpHhJGnHerR2ercSEor/1x2rBoOCpIqc9P7GcnI7akxoSKPnh9SfR7SuK3GF
 RyQ6IPsNJlF90P7IGmQpIgt2OPJfnfoOmPlXkUkKdl8larWWpUr7lsNYnPXLWOcQ6W2F
 Zs/7MuZ1tlFnT8JwSdlU7Eb+vc9ESW0/lQPvDAn8ipAIVSdN0RTLc5hJwtAA5PBWBWDM
 BZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=t551taesygOAp+TVKmzy81V4H4eGswdOIqikNh/PTqTzmHMvh7eYfOWzGYC9NC6Y1n
 +vXdbSdaq20OegsemYEo58Oo5tUie0TdwqbSH9GCV5UMQDKIWjtggEK3FN94Sy5qXZAQ
 gQGZy48/7mjdDEcGa36nQfGgmB99JDDyXbK87KRZdZd9dHba/8bDCsqipYSmvjHvsDBW
 A3/UJOVxbZJd47fXtDHDmNTIyi9z8pL8n4e6nujdCqpK0FNN45occ8l6yftsOU7XcQN0
 oyZpWt8rRhhXsPrOBYVc6ZgdbfUNBu8svUe/9qAs81vibrqZ6WT2bWDyt8rdwpHfLrKn
 q2tg==
X-Gm-Message-State: AOAM532r0b0LUp5O1W+ivRS1fDd1omZA1XACT2nEhfwhkzslk4W1fDdZ
 BmSr+IaVKHJkNv4iqByIlLM=
X-Google-Smtp-Source: ABdhPJwvwamLoP+1QuroMiFTCmhR6rH3SSRmOiMJ5l6SjFj5E0rwYBnmpCZXtO6EELLJm+q+fxSJVA==
X-Received: by 2002:a17:90a:4a18:: with SMTP id
 e24mr9208627pjh.140.1610033717428; 
 Thu, 07 Jan 2021 07:35:17 -0800 (PST)
Received: from localhost.localdomain
 (ec2-13-212-86-85.ap-southeast-1.compute.amazonaws.com. [13.212.86.85])
 by smtp.gmail.com with ESMTPSA id q26sm6308528pfl.219.2021.01.07.07.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 07:35:16 -0800 (PST)
From: xuhuijie <huijiexu295@gmail.com>
To: gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jirislaby@kernel.org,
 yepeilin.cs@gmail.com, b.zolnierkie@samsung.com,
 penguin-kernel@I-love.SAKURA.ne.jp, george.kennedy@oracle.com,
 natechancellor@gmail.com
Subject: [Patch] fbcon: i want fbcon soft scrollback feature come back
Date: Thu,  7 Jan 2021 23:34:44 +0800
Message-Id: <20210107153444.1719-1-huijiexu295@gmail.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Jan 2021 08:55:35 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

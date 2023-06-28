Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FFB740F11
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 12:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B9410E027;
	Wed, 28 Jun 2023 10:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8A710E027;
 Wed, 28 Jun 2023 10:44:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d9865b848so3934139a12.1; 
 Wed, 28 Jun 2023 03:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687949089; x=1690541089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BsdkSefQ8IYbI/3B2PMzrD70xYP7RTu4xTohJobc3G0=;
 b=WjYus+kk3lIjMOujmFHVqaj4jWRurauivNOWK6xaImNOoo/hBMYa9/D3bUvx1ShfYb
 440HkPvoLDttOPFJqiIGWaA7jyzcnWof0ZbbOk02piAw1XAT7J0zLUi7GEoqR2mBzsT2
 KkKhZTPrkkwRx6LtPd0Xh35fkJg3CGXBKpfkch03mZQ6eTdzYsGbGNDCHpgwHnRHOx/i
 6IFEG+DbN1jrwPMu8KFNBWYa0RISUfAgQMeJMyhn4LlF7nBmRLWMMEx/fvi/HTvq9kj3
 KR7OJLoHig0oSZw9UeWoOfJxxisBmLlmQl6IA5BaBtX7o33HSwDCmjrQfVeBBvk27Vcm
 wHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687949089; x=1690541089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BsdkSefQ8IYbI/3B2PMzrD70xYP7RTu4xTohJobc3G0=;
 b=gUJRHlFB8Eg7A0XgKVkEeu1X0vOfiN1BUtramt/fNUFwwCP+aUEYm4y8qLZDfzMs/w
 5DuH57PjKHnzhs+1gc6BDBuhq1iBgFD5u4NMmf/XhS0+SnDdAkFe4XanxVF3t3awpTEa
 MxnmQbQAuo5bl6nEoZXn7SElC2bTBvDoCKN51W4x3fKjiBbEDQJSnW0eecYu0g1r/hhp
 v4nfVz7tcy62R4l5SxyFqIrD9eQI9B25lRShlcuVcsPqz5JktS8otBRur/Ji5wzl28Re
 uOZGvvDSRbH3iZtl/ofXAp89UuZ7ODSuV6Nuw7Hoccail1y0gWfkAvhRklzmPUlVXbZt
 90PQ==
X-Gm-Message-State: AC+VfDxvxUesMzmBAXbGH2J9Soo5YtGSEXt217cBNHJPuFARGiahbq+T
 umghJPOcLxcwJexxv/GU3S9wqDFYby4=
X-Google-Smtp-Source: ACHHUZ4ISwWuR4s436R+U5S+PO+uJdXT+gJpWUeBdjRi0YHxbZlXRyNGCcUCClw5lFfFH+MKXctJVA==
X-Received: by 2002:aa7:d396:0:b0:51d:aa00:bdd4 with SMTP id
 x22-20020aa7d396000000b0051daa00bdd4mr3553653edq.24.1687949089073; 
 Wed, 28 Jun 2023 03:44:49 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a4:6600:e1e8:ea62:da3f:c009])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056402515200b0051d9580b00esm3463537edd.11.2023.06.28.03.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 03:44:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Subject: AMDGPU patches for the drm_exec context
Date: Wed, 28 Jun 2023 12:44:40 +0200
Message-Id: <20230628104446.1369-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hey Alex,

any objections to merge those patches through drm-misc-next? If not can you give me an rb for them?

Thanks,
Christian.



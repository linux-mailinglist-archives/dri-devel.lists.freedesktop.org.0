Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51374F110
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4E10E3A6;
	Tue, 11 Jul 2023 14:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B06010E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:04:23 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b734aea34aso810091fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689084261; x=1691676261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BdpcIEYUUdihFpwpm2ca3DrV3eAkUJoAgB4GuGHv5rI=;
 b=LQ0NHomTxnvfiwW0cuYITuJEOccgUOW9OWjMZIQkHm2WQqTJTLqPTJxOHkMzmvrx1s
 jXtMQfSaCbqkuE5EVpSL46bQWAJFh50SYx8YlCTYT1tRIK7opWlZhuzmw+02KhedWLF9
 Hdk5+7EJrDNjJUh7OEKdBd+kQ08DDMoEaPpVQeDsQLafIdQ1mxS0n2TUyu6+J8Aufjwu
 lNVaOIn4i58WPDw6/wjujpbQ3rljpmiWd9WgyJNMYuLOu8Gz9iuSoNi4lyuy2RybQJho
 TbSkdMlQrjueCa+7aylhCWa6L4WTnm+4ZLutvi8ZDk2N6qnIwQK9+zxav7lnOLubeOff
 QdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689084261; x=1691676261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BdpcIEYUUdihFpwpm2ca3DrV3eAkUJoAgB4GuGHv5rI=;
 b=KLAkw3OKtY63KRv/LoSKqUnJH9Rps7RS7bZZx5W+X4rxT/zAa1JJhgfupJwczwse5v
 tJDs+ZPtnSUmatPZuOnA07UMTgr19b/v9HTY+/evbINhdQ27cudnUIFkWpqbKUeRgM/0
 o71MAF1P/VDR1tkIZNRwKO01gNCFf9SaoxIjNJSyU5jbp2WOy3C8V7sW52g69W54ze3L
 DcmucngfzqJqCs7RVOPthQgVPsXl5ThgIMPIxrQDCF/tG5FBkUnVSAB0bR8XoYOfEXWj
 qXDBJSKUfkY7osxxyhrPThOnxqo6MYJ/iV7LcD37UOqPb5BPLlwURE37HZb2EPrJ5izt
 ngaw==
X-Gm-Message-State: ABy/qLYiMWlsWhD52qGHYc2jjSjpXf1zqjg44H9048WMxOGJVwqGG9iD
 MxOdrU98Q/fNmfFSABXTrgo=
X-Google-Smtp-Source: APBJJlGvU4WSIU0hK8h8ujqbyffxl+1oVIt17piGu73JBXJBzoJS6YWxTNyF9yqqxXrZlLEuAh01zg==
X-Received: by 2002:a2e:8085:0:b0:2b6:d9b0:875d with SMTP id
 i5-20020a2e8085000000b002b6d9b0875dmr13576003ljg.34.1689084260952; 
 Tue, 11 Jul 2023 07:04:20 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:dcae:ab99:6259:7e2b])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a170906505200b00989257be620sm1199006ejk.200.2023.07.11.07.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:04:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: DRM debugfs cleanup take 5 (resend)
Date: Tue, 11 Jul 2023 16:04:13 +0200
Message-Id: <20230711140418.3059-1-christian.koenig@amd.com>
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

Hi guys,

sorry for the delay, just sending it out to the list once more to get
some acks and rbs.

Apart from that the CI systems seems to be happy with that and I think
it can get merged now.

Regards,
Christian.



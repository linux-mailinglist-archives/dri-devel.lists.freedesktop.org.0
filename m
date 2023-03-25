Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638896C8CDF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 10:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E161710E0AD;
	Sat, 25 Mar 2023 09:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A67710E0AD
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 09:05:00 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eh3so16591794edb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679735099;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eUm+1Er8J4mA08jd9h9wupHIxzquMabgZSqhqbi77xA=;
 b=DpDJpU4u9vPI0TdPAd0ObcsV12jDjW0T05YYDO1bC2xweDGXoRJ31yDUJf3QYk6cnh
 s0bdw358rD1mMcivpzFVuFnwVbVK6P7klJMLz1GgXqdUM6kxweQc+mZuWoPwWttLqLIH
 LAz7NRcmr897ib9EOYg0VJwNdsVaDQwWQYtfLC8e0OBrPJiBTqsaqXPT8pIIzl5J+kWw
 YbcvmvRbVukXbDRaiAwVvei5TCxJ5d7gPDomt2uWk7a+EGvkvqnwdfdy/thBlxN3b2N5
 MP/WA/mpPQaOQRHyHPzfs14NSQrJOMnBpWYEYfzkSWVNbNaa5sfecATdZRh6FBm9aW7o
 wElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679735099;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eUm+1Er8J4mA08jd9h9wupHIxzquMabgZSqhqbi77xA=;
 b=lJjtqo2rxoHlNzRY1TbCSZ4aFmvGfqR1NLqus6g6+5vgFe8CGQQtDs8zufQqt3Jra6
 qNlSY4GjlJW+0ZUFECyrJzy0v1q+GkesHNGJoFYyq77yO6LXKXS+Lc8ZTy8PyXbMyLpJ
 3kUVO8/eC7RyhfJ3D8jsj1EsirKygAu1J5f2exQr8arTmYhE3UnYo+9BNqVxmeQShI7c
 b1+BHJjjgPILCvFny43PF/l0vyDc+2mn4USu9KeML2HLk5Nha6aUZ66uErY9+QdcUQEq
 qqTg+Dyk+FaET7KRNdv3Bjyg32yit08ec682QmT0bjqJzMwCd7yhfsDmnRv3/inmy+ZW
 PhVg==
X-Gm-Message-State: AAQBX9eWyDorz5J8U7uI5zT98+h1R4ThxNyGum+tPNiWt3aO0uDgCjF0
 JriTryZAnFUlTYaFe4Z7tgg=
X-Google-Smtp-Source: AKy350a3QLk5k4mdGcJLdb3269v1Ctv+mlh6CKboR8r+zU/qXJ8JumFgQBfwZpFCFI0vabaYaO6UOA==
X-Received: by 2002:a17:906:184d:b0:8b1:e791:faef with SMTP id
 w13-20020a170906184d00b008b1e791faefmr5127207eje.67.1679735099214; 
 Sat, 25 Mar 2023 02:04:59 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f3-20020a17090624c300b0092a59ee224csm11435206ejb.185.2023.03.25.02.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 02:04:58 -0700 (PDT)
Date: Sat, 25 Mar 2023 12:04:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jim.Qu@amd.com
Subject: [bug report] vga_switcheroo: set audio client id according to bound
 GPU id
Message-ID: <b5601f96-2475-4512-b0a2-01b736acf70e@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jim Qu,

The patch 4aaf448fa975: "vga_switcheroo: set audio client id
according to bound GPU id" from Jul 17, 2018, leads to the following
Smatch static checker warning:

	drivers/gpu/vga/vga_switcheroo.c:378 vga_switcheroo_register_audio_client()
	warn: unsigned 'id' is never less than zero.

drivers/gpu/vga/vga_switcheroo.c
   362  int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
   363                          const struct vga_switcheroo_client_ops *ops,
   364                          struct pci_dev *vga_dev)
   365  {
   366          enum vga_switcheroo_client_id id = VGA_SWITCHEROO_UNKNOWN_ID;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   367  
   368          /*
   369           * if vga_switcheroo has enabled, that mean two GPU clients and also
   370           * handler are registered. Get audio client id from bound GPU client
   371           * id directly, otherwise, set it as VGA_SWITCHEROO_UNKNOWN_ID,
   372           * it will set to correct id in later when vga_switcheroo_enable()
   373           * is called.
   374           */
   375          mutex_lock(&vgasr_mutex);
   376          if (vgasr_priv.active) {
   377                  id = vgasr_priv.handler->get_client_id(vga_dev);
   378                  if (id < 0) {

enum types are slightly up to the compiler in C.  In this context it is
an unsigned int.  On the other hand vgasr_priv.handler->get_client_id()
never returns negative values.

   379                          mutex_unlock(&vgasr_mutex);
   380                          return -EINVAL;
   381                  }
   382                  /* notify if GPU has been already bound */
   383                  if (ops->gpu_bound)
   384                          ops->gpu_bound(pdev, id);
   385          }
   386          mutex_unlock(&vgasr_mutex);
   387  
   388          return register_client(pdev, ops, id | ID_BIT_AUDIO, vga_dev,
   389                                 false, true);
   390  }

regards,
dan carpenter

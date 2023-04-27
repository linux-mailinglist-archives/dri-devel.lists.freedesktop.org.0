Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCD6F12C6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 09:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D105010EC6C;
	Fri, 28 Apr 2023 07:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1318F10E177;
 Thu, 27 Apr 2023 22:31:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso52375495e9.2; 
 Thu, 27 Apr 2023 15:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682634672; x=1685226672;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9YwVsmVVDarSDi7lexCHKjwoPqtG6yE/kkh74CrpRwE=;
 b=Z+WftlxiamQVYno3Ss4dIJ7kWanH5VpBuW6u0jiuFLLY13GKHvjztZFwoTJvL4sySC
 UE+jfE4E0RQqM+5Pn57q58QWcCwhsEOGD3F+PZF0OppGNsQ/xATQXPTOXzgHpdtR1hJf
 GeFIi6fDgyd2LY783QScUBoiK43z8h4Yg4FQuasAwmQPU1Us438oXgTB9G140mp9e/TR
 p77ur4vHPiHSmLlGtUAmtGbeecixo3GlMk4KN7VaHm+9DmyDVqXW4DCt/2nluXbvzX2l
 VQQ4oPne796U4Qxi0gCxkjd+yDFZHtDidnZvzcTBHcaOtDKolgIv9BL6EefLsgu25nap
 Os9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682634672; x=1685226672;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YwVsmVVDarSDi7lexCHKjwoPqtG6yE/kkh74CrpRwE=;
 b=TKGAs4Jvw0BMRre3uWbEJizONDSU2jCe+WXku7L3vLCFQFLGOi3indBg893hz5z1kf
 pcqz2XekWxpng0JIMwu6u3jrz8EzNWrlQleUwysLfXWhWVDnYAJCK05QDPvoPds2NX1i
 8842sjs/1AM3htsrETNqepcNzSDXs3yHAVWib7JnTYz+yuiB+G5XSxrYDjtuQaRFjwqO
 v1NorIaAUiNsj3j7X10lkXsbAcURXnkSae3jNYLc9yqBlr96wr/07EXWNDxEPfq70gVd
 k4DwCyyrVUY4dhJ+SxVxwVFLvTkFQ0XHH+MdlzIncoM2EKPgwdwTC2Leh9rgxqgcZcOY
 BXhQ==
X-Gm-Message-State: AC+VfDx/9tvIMAa43Uk49s65a/z0t6CMEVxjoaVxLDD7CPsCRSaKpjar
 RKTHIGSdd+OriAzpSWgbfCo=
X-Google-Smtp-Source: ACHHUZ7QrE+EooGBm+c2JqLPVDs2AKDArtu5ftSqCgTI3BvqxlrY3b/RYjNvy2y6gaRGS9ItlsQmPg==
X-Received: by 2002:a05:600c:2285:b0:3f1:7123:5f82 with SMTP id
 5-20020a05600c228500b003f171235f82mr2416493wmf.12.1682634672001; 
 Thu, 27 Apr 2023 15:31:12 -0700 (PDT)
Received: from [192.168.2.83] ([185.76.28.46])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c21c800b003f2390bdd0csm13810840wmj.32.2023.04.27.15.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 15:31:11 -0700 (PDT)
Message-ID: <3e6ce087-411a-8f2e-974e-2a9379587159@gmail.com>
Date: Fri, 28 Apr 2023 00:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: ville.syrjala@linux.intel.com
References: <20230411222931.15127-2-ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/6] drm/uapi: Document CTM matrix better
Content-Language: en-US
From: Xaver Hugl <xaver.hugl@gmail.com>
In-Reply-To: <20230411222931.15127-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 28 Apr 2023 07:47:35 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I can't say anything about the other commits in this series, but
"Document in which order the CTM matrix elements are stored" is
Reviewed-by: Xaver Hugl <xaver.hugl@gmail.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10C776274
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56ACA6ECD7;
	Fri, 26 Jul 2019 09:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F2C6E7BE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 17:18:49 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n9so17141685pgc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
 :user-agent:date;
 bh=pKF4uTEG2V2736jXBsUmCSSZEQt/JQWcWxojg2SNHvQ=;
 b=MpxUMpnQqXXGM1+yYZQ9zyz67Sw9DYMtUS7iN2qD6Cfh9qJ5F5N0rw7AgG5iaZcn/p
 W42ROLc1eBZSayNT+7fBmsCrrCuMO5948Iygwtm6OgydTGve7CU2Mt4RjBYkr6i80qpk
 0AyODNNB65M7GKGnrPVL+VOV0X6PQ0+tV8HAS/SBcQkP0cmmbq8lU65JcTZRzx7qlzGY
 oaZneEEzt3IW3WSKNVu27p8VqZh1qt17gLXav3uKfV6X4qDtOME3TxSROsxZo8S71wsT
 gZojXQmq9b+ndI4Whk+wJPPJLHjBeWG249YMaUcaAgXXGbsTyl9IiTCBvyUHXRcgeAfP
 nCvw==
X-Gm-Message-State: APjAAAUDJ4Tn0I9MtdMgQg0O21Z77wViRcmnA1iXHEdHjfk597Mum62Z
 LRRZwsYgk8etEohKmfhtDwCXkA==
X-Google-Smtp-Source: APXvYqwyvvB59B3ughI+E3wp1WnBBj0Dam/Cxzjm5SQLtruxS4EDniq2hIg9r9i6o5dS5o9HEqeP6A==
X-Received: by 2002:a63:7245:: with SMTP id c5mr73569315pgn.11.1564075129171; 
 Thu, 25 Jul 2019 10:18:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id l31sm88237663pgm.63.2019.07.25.10.18.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 10:18:48 -0700 (PDT)
Message-ID: <5d39e478.1c69fb81.53508.87c6@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
References: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
Subject: Re: [PATCH] drm/msm: Use generic bulk clock function
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Thu, 25 Jul 2019 10:18:47 -0700
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:to:cc:from:user-agent:date;
 bh=pKF4uTEG2V2736jXBsUmCSSZEQt/JQWcWxojg2SNHvQ=;
 b=YzYCDtwsX9ubBUiVtnqndDSs3hmpOz1P0CeQ2TgcZ8Gn4gowsx2EV6xe/gDciXbo2V
 cXdMt+RL/GjOKn65B/pUAoWDBBVtRu8cL07AYgSTHhJrpiSVUcvsdrZEvC/sw2oNtyHQ
 J06ebgNs46VM6Kb3iZgbNX/a4WxRa0QpnyGOo=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>, Andy Gross <andy.gross@linaro.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKb3JkYW4gQ3JvdXNlICgyMDE5LTA3LTI1IDA5OjUzOjU1KQo+IFJlbW92ZSB0aGUg
aG9tZWJyZXdlZCBidWxrIGNsb2NrIGdldCBmdW5jdGlvbiBhbmQgcmVwbGFjZSBpdCB3aXRoCj4g
ZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3Vz
ZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBTdGVwaGVuIEJv
eWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2054A9DD6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F054110E942;
	Fri,  4 Feb 2022 17:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7C10E3A4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643996412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Fgk2tPp8Iez8ffo3teobZs6lfET8NrmEOulKtLL6l8=;
 b=FraqRedxJmi6iYMk3nDELEHSOnmSaYwA3f1vlSwJbptupyaF2ZUnNjPeBIo4waKxPfwmBr
 4sCnb+91IEtCcGShYOoW+WlRKlykPlzG08+4NePSBq0LB7+IevOIsRcmZ6PMq5etGKD6KE
 wHAiXLPKXqlcZPfE67J8sIXIMpsXCRo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-QTUgFLVQOBa_rCii2cHwtA-1; Fri, 04 Feb 2022 12:40:09 -0500
X-MC-Unique: QTUgFLVQOBa_rCii2cHwtA-1
Received: by mail-qk1-f199.google.com with SMTP id
 u9-20020ae9c009000000b0049ae89c924aso3994036qkk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 09:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=+Fgk2tPp8Iez8ffo3teobZs6lfET8NrmEOulKtLL6l8=;
 b=2giJUM6U9ZyS+fYr7iwpgcMwQBneuZprvjXjinwaI8Hl1efJU6uAVbqBF0BCszJ0Cs
 JZyVJjLvgAi7ya1wj5iR8vkPLvTJXj1eGxUQSuLkNy8VnHl8w7k/fHXu8BGpDULRITKX
 PPPiUIflvxcPL86ejWpndmVWnD5IDRr77/z1YiUUNqMNZwLtmSD4jnzJsg1hRxa5I54G
 Lf4SsslguGK9G8iztA4s9CKHep3NLf0r0jy22SEEroUhDSEjBCTdHd4BplbluL8TEYZ7
 6Gf4Ea+/O8wsD1gpxrOSlYkoYkx9uOnW6ej07p9m5aqKsmvhpmrPwPSbzvhyzYNQUbLL
 sg+w==
X-Gm-Message-State: AOAM530zNE4CCEOnQuVkZV/QMGOux0wUJAIcz1GYtvws5hggFBUN+CvG
 1v24B4yJpTY2JScFWRReQWNbPZrDmD+4WSltvWmt6dXWdhG7qYTei6/i5rvwGx7o5nHNHXETn0Q
 HGOF9A3ClKlC4auVp8EfcemSYIEzL
X-Received: by 2002:ac8:578a:: with SMTP id v10mr76195qta.148.1643996408381;
 Fri, 04 Feb 2022 09:40:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKdGHijSYkEZ0PZ6zI7XULxLGuuiXeTX+kTLZtxdulDdoNZ2sUxc4s+6mCyl5zpu6dwwjJCg==
X-Received: by 2002:ac8:578a:: with SMTP id v10mr76176qta.148.1643996408156;
 Fri, 04 Feb 2022 09:40:08 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id w22sm1599186qtk.7.2022.02.04.09.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:40:07 -0800 (PST)
Message-ID: <8db37efd8113f33107175b353f1f996523db7b9c.camel@redhat.com>
Subject: [Important!] 2022 X.Org Foundation Membership deadline for voting
 in the election
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Fri, 04 Feb 2022 12:40:05 -0500
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

The 2022 X.Org Foundation elections are rapidly approaching. We will be
forwarding instructions on the nomination process to membership in the
near future.

Please note that only current members can vote in the upcoming election,
and that the deadline for new memberships or renewals to vote in the
upcoming election is March 17th 2022 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site at:

https://members.x.org/

You can find the current election schedule here:

https://www.x.org/wiki/BoardOfDirectors/Elections/2022/

        Lyude Paul,
        On behalf of the X.Org elections committee



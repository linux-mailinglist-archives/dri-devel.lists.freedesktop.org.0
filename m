Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F54A8F61
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A89110E98F;
	Thu,  3 Feb 2022 20:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EA410E98C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 20:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643921490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JliFKaJ1uTXtrZZEh6WCt3CKlyHPvhZycx+TPymY9/o=;
 b=CjTZNvTOCJXKdESu1SCV72FiDSO7jugVXqT8Ug0VN3yjANlYcOheWjcN4BKU90k1AoBooo
 6NQPOipYrPTioc1v2eeToW/1g+Y8r4xT9XJ05rV9/AfojDeFAsMb8UlrnOvemQk+DaJlpQ
 rdW9rO7S5NAFeJkmPj9OhXhHzCf2zxI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-s6tJNJFkMwSgyF3Y2_GSCw-1; Thu, 03 Feb 2022 15:51:29 -0500
X-MC-Unique: s6tJNJFkMwSgyF3Y2_GSCw-1
Received: by mail-qk1-f200.google.com with SMTP id
 k190-20020a37a1c7000000b0047d8a74b130so2458458qke.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 12:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=JliFKaJ1uTXtrZZEh6WCt3CKlyHPvhZycx+TPymY9/o=;
 b=KWhhzoP59dcDiVU+bW1VjJztLbyqhoGWTd7iXMnO6ycDKM5cCHx1V80TEpgtcWhQSk
 6q/tq+/zMEyNbqZBMe9agEZyvWA2670i/+8G9km7kMTczlabqfkAEb8gJMR9huEE5pck
 q98IrZokRVJaBb6MBq3qRvA/wjBqfR4uLOQPFYEVg4sFPaVpv/7b/AEb9hyrWAz9UH9e
 GR+FBSq9QtURLr8EUOGjVPVpV9YJrYyMbEZq9vFiCdAM/syCW2/jsFalcCsvnYjnEsIA
 D7Fj2GVV6yCERxfAq9+jAJ5zgoB4ihgINzbguInggX2dVMw2+FDzvWQfUcEP1hForKa8
 IlVQ==
X-Gm-Message-State: AOAM533xoQhK5zEKETcA5eNZHcvHFzmvFZDaRnggDicFQNE1cl2JGlg8
 6XvTpWnaS0Lw9NDwUtFwtHL9LF9aofD2vk+d5DE1rr8xrQ9s8eeKTufGZXOqHuFlT3YKITSS0Sg
 NL+sIQjWuQ6dnya6uOT3Sd05nySkD
X-Received: by 2002:a05:6214:e68:: with SMTP id
 jz8mr33316319qvb.114.1643921488998; 
 Thu, 03 Feb 2022 12:51:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD+P2c5ZElNlEv0BX2inOVXFRs4RJUQwA1UUPu5B7QviUoVaMk9uc5WAMwZkyDyk2qFjcZdw==
X-Received: by 2002:a05:6214:e68:: with SMTP id
 jz8mr33316309qvb.114.1643921488822; 
 Thu, 03 Feb 2022 12:51:28 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id o18sm10913876qkp.26.2022.02.03.12.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 12:51:28 -0800 (PST)
Message-ID: <8a36c4ab07a82833e4086773a550d215e54a9e3f.camel@redhat.com>
Subject: [Important!] 2022 X.Org Foundation Membership deadline for voting
 in the election
From: Lyude Paul <lyude@redhat.com>
To: xorg@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Thu, 03 Feb 2022 15:51:27 -0500
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
Cc: board@x.org
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

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


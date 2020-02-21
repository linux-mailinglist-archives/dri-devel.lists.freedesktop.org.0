Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E86E167DAD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 13:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E666E29E;
	Fri, 21 Feb 2020 12:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DF36E29E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582289157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pBLVBUs542X1Vq8pAdGQmP+xNdNH0Q/EkNS8GTw8+pk=;
 b=ZmGGFtw0L4ZS2T1Or3WGz4/qqfQvJQO+FairyrMoDr19YOzcAR7AkLp+PivlJYkaPOg6pH
 pgBnyUeF7+0oRFBknb3mkQXxMadhGxffy2sFb9eiCXCxxKMTYwCbjg+2OaFByY3HXQE+E2
 fyEEW1VMFVf7bE96gsI8nq10K5slBG8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-r6C4TseXPFGbkg_0lxQdkw-1; Fri, 21 Feb 2020 07:45:56 -0500
X-MC-Unique: r6C4TseXPFGbkg_0lxQdkw-1
Received: by mail-wm1-f70.google.com with SMTP id z7so531827wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 04:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=pBLVBUs542X1Vq8pAdGQmP+xNdNH0Q/EkNS8GTw8+pk=;
 b=F/FzvUVHJHdScq4Snz2AtA5aagYwSUEOTaJgpZw86+ZJT86tReSxYIVtCUWX9nnAl2
 2pFgfHb677/L/rj++m/bchGpzE6MxrhXqifGj/ZYGhQ+p+v817RSLFrwPfkZSlJOQjMR
 rRuEcQPfGT9NFq6PxMPG0k2aBDiAka4iK/GdnizAX8gqqAYC8Vb42NE7kPT6oqTBR2mP
 glfUI23dzHKOaQQb8W15mufLN1JKZL14tzOEavHBkGuDTyX2dIoDlj0aYVLAMgMfb5lO
 hJ6suAjJnYFJ3O5g1z2tOVy0mRHGYene2r8pcPLI12irVy7l/CfwyhGNA4lmeo14zJsK
 d6VQ==
X-Gm-Message-State: APjAAAUVfrKX8I2bErfkfymWpsZBXhlhv1I4RYbzdooDUYVx8KK9hOz5
 Hdgu6sDQRWCdz8W2eOAGp663nj2aKQS5oqA6voUwYjFspX8rijYnstaJhpnWiLIIFSDCaNZ9/TK
 gVYjsl6TzLseKHdPa+gXcCmj2rTFe
X-Received: by 2002:adf:f084:: with SMTP id n4mr48240487wro.200.1582289155137; 
 Fri, 21 Feb 2020 04:45:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtiGq5NOrdy9I6IUtNFUV96T4BBoSP5U202t66huPoYfCrAk+zdHN+jraDhS1vrqNKI/yqCw==
X-Received: by 2002:adf:f084:: with SMTP id n4mr48240462wro.200.1582289154929; 
 Fri, 21 Feb 2020 04:45:54 -0800 (PST)
Received: from dhcp-64-37.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id r6sm3972501wrq.92.2020.02.21.04.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:45:54 -0800 (PST)
Message-ID: <eea7179c93b5a5f3766c169f71567e1d75dda304.camel@redhat.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
From: Benjamin Berg <bberg@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Rajat Jain
 <rajatja@google.com>,  Mark Pearson <mpearson@lenovo.com>
Date: Fri, 21 Feb 2020 13:45:53 +0100
In-Reply-To: <87tv3kxgyx.fsf@intel.com>
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
 <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
 <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
 <87tv3kxgyx.fsf@intel.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
 Jingoo Han <jingoohan1@gmail.com>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Mat King <mathewk@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Nitin Joshi1 <njoshi1@lenovo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Darren Hart <dvhart@infradead.org>, Nitin Joshi <nitjoshi@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 2020-02-21 at 14:28 +0200, Jani Nikula wrote:
> In general I think it's preferrable if the hotkey sends the key event to
> userspace that then makes the policy decision of what, if anything, to
> do with it. Everything is much easier if the policy is in userspace
> control. For example, you could define content based policies for
> enabling privacy screen, something that is definitely not possible with
> firmware.
> 
> I emphatize with the desire to just bypass everything at the
> hardware/firmware level, because that is totally in your control (as an
> OEM), and requires no interaction with the operating system
> initially. Exposing the read-only state of the privacy screen is
> helpful, but prevents the OS from building more advanced features on
> top, failing to reach the full potential of the nice hardware feature.

There seems to be a slight misunderstanding here. On the Lenovo laptops
the feature is automatically adjusted by the Firmware. However, the
setting itself is read/write and it can also be controlled from
userspace.

In principle, I agree that it makes sense to control these things from
software and have a toggle key event that is send around. It has the
unfortunate disadvantage though that it requires updating the entire
userspace. Including the ugly side effect that we continue to have
trouble to support these things on X11 due protocol restrictions with
"high" key codes (>= 248).

Benjamin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

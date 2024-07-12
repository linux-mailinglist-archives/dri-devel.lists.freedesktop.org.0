Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6ED92FDA6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 17:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7C210ED32;
	Fri, 12 Jul 2024 15:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VokgYpON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0410ED32
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720798365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEz8WMihH5dvgSwOSmQJ46Poh9tPzMYsjL7lTQ558D8=;
 b=VokgYpON2MWkgxPjtoNmxiwufy8DNYXM+mU0bYZ4idf59QNKL8r8RK841NyNygplmC53Hk
 4Z5uDZsopJVM3o40o+gUoM39ZBXi4/v9s4I+y2d9OSQgkQISki4j9HFT9EWT1Og+Inyhav
 oJ3VT0qHVgGyuyOgB5/tzb4t0TJMFZY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-TTpf7JIdOX2pSsegsjjINg-1; Fri, 12 Jul 2024 11:32:44 -0400
X-MC-Unique: TTpf7JIdOX2pSsegsjjINg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42490ae735dso19873095e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 08:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720798363; x=1721403163;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IEz8WMihH5dvgSwOSmQJ46Poh9tPzMYsjL7lTQ558D8=;
 b=AY1ctOiQ+/6MCi1md6suTcuWqdKjs+OnwdqgN/eixX378hJqtcDHxMHK7Khqb391DR
 ZTqczMOnRCQCPTMTk5cd0P+0HMS6ALBFe+ClWwmxhg9GnUAuT9NwZUi9cbFygHIbsIw5
 gt6h8AykqJkcTSqGBuo4cPpkrgaiKrJHSuJH4V0Nt9vymbU6QhuMwN1RsJHo3B0chfUh
 mLeokOAKUf0toRZiCqT8Y+hJrKMkKM0fyRE7nPTV8PPr8feHUUsJnrGEzKo+Z4D95jXm
 k9LN9RDtkdjB0/2O0r67zGL6jtQ8/AiXcswv9QShY/LeYurkqiXMMSbFxFDxQMmd+HyT
 jHBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJoIZJ2L2JvfSPJNwM4GVl5w6kFwp2ZZr3DHdZ88dNL8ALVPGnzDwn1/LGTvp/90KmPbgt4NYpiH3nQG6cEfO6qrjN7sz+N9ucxjv5Fa2s
X-Gm-Message-State: AOJu0YyJxR7m7cH0MLI9+IdJl5SbxWJqDSBnCottj4/ZpooE0KrhYghU
 X0NSuhxpueF2i0LStzwSsQWyLEhF56FPMaoEb7v+pIJlFzSQkCBtse5Gx5tsilowbs3AI2792KR
 LdmEauAoYrwIa9k1pRVXpL11PS2x6pS/K6g7aMiejzoZboI1wb3xthCkZgzHvILRpVg==
X-Received: by 2002:a05:600c:2d84:b0:426:5e8e:aa48 with SMTP id
 5b1f17b1804b1-426707db6d5mr103615755e9.22.1720798363158; 
 Fri, 12 Jul 2024 08:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBacZIavOtT2JsUQI/j71t/YaxvZW9vrhlVVDFlkJPuemKNmocYH6M4zKWmAbtWgl9yPmxGg==
X-Received: by 2002:a05:600c:2d84:b0:426:5e8e:aa48 with SMTP id
 5b1f17b1804b1-426707db6d5mr103615495e9.22.1720798362825; 
 Fri, 12 Jul 2024 08:32:42 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:a4d3:4896:56d4:f050])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab161sm10420558f8f.91.2024.07.12.08.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 08:32:42 -0700 (PDT)
Date: Fri, 12 Jul 2024 17:32:40 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 lyude@redhat.com, robh@kernel.org, lina@asahilina.net,
 mcanal@igalia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
Message-ID: <ZpFMmAEdqo1dhj0s@cassiopeiae>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <ZpFDeajsuVONbSYJ@cassiopeiae>
 <0A0C1EFC-29A1-4D73-8B02-CC1C693D6A7A@collabora.com>
MIME-Version: 1.0
In-Reply-To: <0A0C1EFC-29A1-4D73-8B02-CC1C693D6A7A@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Fri, Jul 12, 2024 at 12:13:15PM -0300, Daniel Almeida wrote:
> 
> 
> > On 12 Jul 2024, at 11:53, Danilo Krummrich <dakr@redhat.com> wrote:
> > 
> > You could also just define those structures in a C header directly and use it
> > from Rust, can't you?
> > 
> 
> 
> Sure, I am open to any approach here. Although this looks a bit reversed to me.
> 
> i.e.: why should I declare these structs in a separate language and file, and then use them in Rust through bindgen? Sounds clunky.

The kernel exposes the uAPI as C header files. You just choose to do the
implementation in the kernel in Rust.

Hence, I'd argue that the uAPI header is the actual source. So, we should
generate stuff from those headers and not the other way around I think.

> 
> Right now, they are declared right next to where they are used in the code, i.e.: in the same Rust file. And so long as they’re #[repr(C)] we know that an equivalent C version can generated by cbindgen.
> 

I'm not sure whether it's a good idea to generate uAPI header files in general.

How do we ensure that the generated header file are useful for userspace in
terms of readability and documentation?

How do we (easily) verify that changes in the Rust code don't break the uAPI by
due to leading to changes in the generated header files?

Do we have guarantees that future releases of cbindgen can't break anything?


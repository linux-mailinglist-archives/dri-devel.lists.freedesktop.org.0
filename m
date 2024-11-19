Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE059D2606
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 13:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C2910E2AB;
	Tue, 19 Nov 2024 12:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="MLMLWlXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E1810E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 12:39:33 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6d41176505fso29769276d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 04:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1732019972; x=1732624772;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c7YJRy6S+CzjFVx9ocQATHGYD8RoJ7FS66+Yih1nH4Y=;
 b=MLMLWlXDjvDkfeFbu8fb/aixDZlxJdSu11/LfZOqkK/YyLEVcP+083tU/D80pffHLe
 ku/V5Dr9ch20I+pyY/06s5jDtjvOKW7a9Isgd6g8H8uaDAp+SfE7Ua7w8mp910niKovV
 7kecHY6HKUHu+dW2DVAem5GRrMAug1vltybmfjYDc3b8DOjKRofZX6PlmUTi2RlVWJ7A
 vJccp4b9wZw9COLN5v9VrK7pLzSsPnIG9rSS0uAdBzUcC5WCrIC/h+mrI65rogif8N/6
 JWtZvsnAAaMh9CbosF23Od6ulEqwHcSAJIMmZeCdzMxU9yjQBmHtaz/PzdQR56QPcaUE
 Jggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732019972; x=1732624772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7YJRy6S+CzjFVx9ocQATHGYD8RoJ7FS66+Yih1nH4Y=;
 b=cD3pqjatw6//JxXb2XKpJXAcqwQkMPKyh55NVXkSWSdNpccV7jA91oxJfkp6g4MlB1
 3HZJvhrR9Q7HKUYg4UQ938Mfd7h/qSJZ2waFNINlfyu1GhEHgMsXD5OE0n6OjENtRH/y
 E7rNeB76SjaICAr+N0J6t6aSjv2udYKLqVcI+vxdDTVoWBZSSG/6SFIbKo+vHP+okvHh
 +DWIHtiCiq4n/cJv2O5c7V/hYgvn25mo1kGteEauzz5XZlZetxECJth/jZ6gowv1bcuP
 2kUfuCUAWt5XX38M4PlCrxlvB7AEzJ8VMkCJbYfgA9DCNdyjNY5W9w8mnsnyZ9cSQUoE
 /ZiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN3KuF+3xSqoFB5kToFi8Ayut8vcUZb7YMHvbiGYhNYDL+rJoYJjakb7h11CGIICN++mx7kEQrP4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfJXSesG9xojHVhZXMLcQZka9rXdewwgBb6kIxnHDaotjBm35B
 TRYcmY8wSBgNsp1+QKjesE19JAdBcVebo40q8uM7jV6STR6MXewz/rTJuzDJBu7JJ0rkcZHLD+3
 JS4hRXilsNLEUNn4z6MpXS7KpgcDSMOw8jVwzyw==
X-Google-Smtp-Source: AGHT+IGEtYpIyae7ccJUF5Wq5keNlhdEKLUf+IieAL1BxbNm6KQF/DB1EqtxKvme3J7OUdNvAEIEh0qTSJ+cuaA1xoc=
X-Received: by 2002:a05:6214:acb:b0:6d4:29ae:fd3e with SMTP id
 6a1803df08f44-6d429aeff13mr51505626d6.29.1732019972672; Tue, 19 Nov 2024
 04:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 19 Nov 2024 12:39:21 +0000
Message-ID: <CAPj87rOO58Q1jBO3QdygzuSZpPeabNdBMeXXd7RhNWVOUFisTw@mail.gmail.com>
Subject: Re: [PATCHv5 0/8] Display Global Histogram
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Arun,

On Tue, 19 Nov 2024 at 10:55, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> The corresponding mutter changes to enable/disable histogram, read the
> histogram data, communicate with the library and write the enhanced data
> back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873

The Mutter MR you linked does not actually write anything back to KMS.

Cheers,
Daniel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAD06E45CA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF9410E04D;
	Mon, 17 Apr 2023 10:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD45410E406
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681728934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQP0jhHOILHGUYqqiFPFEP0oFPfgZ69ufmXe3pOVD4k=;
 b=i1zmsvJd27coxJB92ZPlcAYb6rfqQM1HiaHAaplldQOmQ2AFMf1Si7PIweQeL45jhNBDTr
 Fe7eBX4mfWCcnB2/t918VJm58faX9i4kOh1HT0I5wOZnPBRP9JLyUQgTRK6e25HUMJJsED
 YuJJ4MZucH/V0I/MPZIdvC5pXuHlecA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-3HrpyCisOg-vvlUe5R_pVQ-1; Mon, 17 Apr 2023 06:55:33 -0400
X-MC-Unique: 3HrpyCisOg-vvlUe5R_pVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n39-20020a05600c3ba700b003f1732a2cbcso1744566wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 03:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681728932; x=1684320932;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQP0jhHOILHGUYqqiFPFEP0oFPfgZ69ufmXe3pOVD4k=;
 b=NLegS4UyiPHSqJ/INLfolGY7PWGmfxx2tIeZ0MLFIK+EucR9DBUpH6aUervicy23zD
 LkeDcgLaamNna5GlDNEp1ZGATa/WnjascfoqUQbCIhO8XsU3d1sfI0LVCr8jUyo+1Wsk
 yc7SXDxVOCJ8EH+K4fndAES9P6ceJ5xW+63y+1mWdJm0+b9Uwgps+BXyH+Uf+0tovBhc
 oBPbPzsKcoMLpa5ukxZhP43kRRXQbMXtFrWIPJnp38vL0o834YSvmBJ/Cf3iHM0u0tnr
 rnZts7g3Xhm3yefCWT8z/kOAIh5pRxydZy0NRyEQ0Bx1kIdQVo28YbzJzhGzTP33waLr
 30FQ==
X-Gm-Message-State: AAQBX9f+x4NjS7cT7Z20B3ExfHrbsyPMRoZZd92VK1einn2EMTJVDKRF
 pGx81wqhO4QMoktlI/Ui8pUyUtgM6vMYmMYGLP2MmM5bT4DbWyGQ7f02gyDHenlfwjvy2PGKM1W
 rjt6Zoo4aES+MrJdktMnrqCkePcLJ
X-Received: by 2002:a05:600c:3793:b0:3f1:71b3:c6b5 with SMTP id
 o19-20020a05600c379300b003f171b3c6b5mr3472224wmr.26.1681728932429; 
 Mon, 17 Apr 2023 03:55:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YH/86qIG88Tj0beqaD/3sOrt9ZF/SdVSy4Z1Oma4C+GIauFs3qJA38myjmhj9zrBrycpWLBQ==
X-Received: by 2002:a05:600c:3793:b0:3f1:71b3:c6b5 with SMTP id
 o19-20020a05600c379300b003f171b3c6b5mr3472203wmr.26.1681728932040; 
 Mon, 17 Apr 2023 03:55:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:db07:68a9:6af5:ecdf?
 (p200300cbc700fc00db0768a96af5ecdf.dip0.t-ipconnect.de.
 [2003:cb:c700:fc00:db07:68a9:6af5:ecdf])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f0ad8d1c69sm10484005wmk.25.2023.04.17.03.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 03:55:31 -0700 (PDT)
Message-ID: <6ad9509c-11b6-9ada-0ee8-26cf40b3ac14@redhat.com>
Date: Mon, 17 Apr 2023 12:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/7] mm/gup: remove unused vmas parameter from
 get_user_pages()
To: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <cover.1681558407.git.lstoakes@gmail.com>
 <28967f170eceeebf2591a5e4370d0642e0516f9b.1681558407.git.lstoakes@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <28967f170eceeebf2591a5e4370d0642e0516f9b.1681558407.git.lstoakes@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, Jarkko Sakkinen <jarkko@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 amd-gfx@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.04.23 14:09, Lorenzo Stoakes wrote:
> No invocation of get_user_pages() uses the vmas parameter, so remove
> it.
> 
> The GUP API is confusing and caveated. Recent changes have done much to
> improve that, however there is more we can do. Exporting vmas is a prime
> target as the caller has to be extremely careful to preclude their use
> after the mmap_lock has expired or otherwise be left with dangling
> pointers.
> 
> Removing the vmas parameter focuses the GUP functions upon their primary
> purpose - pinning (and outputting) pages as well as performing the actions
> implied by the input flags.
> 
> This is part of a patch series aiming to remove the vmas parameter
> altogether.
> 
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


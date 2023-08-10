Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905B7780E5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 20:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8C10E5DF;
	Thu, 10 Aug 2023 18:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E6D10E5DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 18:58:38 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-76731802203so91048385a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1691693917; x=1692298717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vsyCys9Hf/cc75Fnr2tkebJ8N3paAQId+bMwmSwTxOY=;
 b=g7OHqXPvz9lvXEVQRoNwlIAWD3U3BVaszpP9c4VQfzVew2oR11nq/PKW4heanyaoI/
 6U1ByG/45vFJbE5DUQK46T0mZDn420p1KqetFU1Z18z/8O5hDYyqEsV4csvPtuJ2bet6
 1RxzlwHsoV2+r3lXpMpY6ykdbSzAT6VjZ+V5X6VkUFV99iOC2KYVAIoeBEBlG3YVzTQz
 vS4gAb3eK7oGEslty93LfhmwSi/0ADON52kge07ftO7YW0FKmIbCJA8WiZ1fMmfSqNHf
 VI/hzMwm7iLFsjCcH0TZhUWnPdUw27o0Osbe3rMLkjrT06iA2SeB0AEsvvsggfsmS6gI
 MZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691693917; x=1692298717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsyCys9Hf/cc75Fnr2tkebJ8N3paAQId+bMwmSwTxOY=;
 b=JFBYT7SXH7O+CWck/zdPFabFUG1BC3z2fjC+xiAE40W5MRSvQxcNJBJ3Yeg/sN+s5W
 kFCTXRjx/U0EJlWh41HpnJoJmQjwVsOqT4vSCoM12eGIE3iS3BrWDDj3oCwOriSQ9woE
 QKSeFmIoKnDMHzDgWiBiqPlqqj2OptQsG1ddZZoWh/WUHyYIiMAUbwFKdlHw+KpWZfWv
 itgm3fYufRV4Qe3KV/j9VBzh5QGYhiQKY62JFO1Yaz81jMPNHEN7/VSz/UmWuXQuekrG
 BDZwf0y4T669J/iUFAMd+SWS+bQP2SG+YBgEUrk7JMuJwOU4jgeDJYmgoJm97pm0/YX6
 d7Vg==
X-Gm-Message-State: AOJu0YxcrK/d24UdilX9VzTA3Jh/1pUFuvUn4XwlTlazPA+RWxC/Qklx
 HjPn8WU3I00tv3YoOf3jEdvpTg==
X-Google-Smtp-Source: AGHT+IG2wYwwESDSTMeata50KjIGSTDd5oFZ54ICUMsQbCPWTAM07sDaAobSCA1IWHJxW0hVcjfxmQ==
X-Received: by 2002:a05:620a:4148:b0:76c:bc4b:92b9 with SMTP id
 k8-20020a05620a414800b0076cbc4b92b9mr3903660qko.11.1691693917177; 
 Thu, 10 Aug 2023 11:58:37 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26]) by smtp.gmail.com with ESMTPSA id
 x8-20020a05620a14a800b0076cc0a6e127sm677945qkj.116.2023.08.10.11.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 11:58:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1qUArj-005Ifq-Qt;
 Thu, 10 Aug 2023 15:58:35 -0300
Date: Thu, 10 Aug 2023 15:58:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Message-ID: <ZNUzW3X3P0JvL4nI@ziepe.ca>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
 <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 stephen@networkplumber.org, Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 11:44:53AM -0700, Mina Almasry wrote:

> Someone will correct me if I'm wrong but I'm not sure netlink itself
> will do (sufficient) access control. However I meant for the netlink
> API to bind dma-bufs to be a CAP_NET_ADMIN API, and I forgot to add
> this check in this proof-of-concept, sorry. I'll add a CAP_NET_ADMIN
> check in netdev_bind_dmabuf_to_queue() in the next iteration.

Can some other process that does not have the netlink fd manage to
recv packets that were stored into the dmabuf?

Jason

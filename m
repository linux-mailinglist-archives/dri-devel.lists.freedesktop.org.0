Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0AA2C994B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC136E529;
	Tue,  1 Dec 2020 08:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF4B6E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 16:08:23 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id v11so8482991qtq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LnvYCaUrTiypHZ/aT7vJGFEAxYKcosThUHM5obbTnQc=;
 b=OgTOfaY0SCCNec/T6B86kXclX8n4mexFUUhbri8EsGfzATLk8V+xx4xiiajAWefYoD
 Bk5kSC2iWCH2m48oPU1yWJ1vK32rtv1CfChI2u8jUO90Z9TFqF3Kkh2hs2DaE3TIa01K
 Rwl56hPFWkZTY4JKUTiiAelg7sgXoffuM3JaOnPv4c0sUjg7DZPVcrTyFulnLTM7oeG6
 WX9MngUBVjirIS2ts+EB0ZX28eT38bYSYgZj3Box+gEQJ2frWXLOvpsgcaHAN2WRX015
 zYzungsCNl2HDTm4Ow4Opbu9cUiceaNVFrsGYXFdWbjsYfFwl7Zfb3eVmn9WkXMz2W/p
 3ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LnvYCaUrTiypHZ/aT7vJGFEAxYKcosThUHM5obbTnQc=;
 b=anAAp9odYbXrPMEzmdhrNBJWhnmAJiSLv/qEdru9YSIfAKR46k/8BONcCYPlxL/LPk
 ciryClScVe+mrLVLe+B91nhe+F4cxK6lczW8toVwqLliRwfF6WbS56iH8goY5J9li2m1
 lXJJaOaIppo6wqxJqM2yDwwZy/XZUPC75c/BT6r/cdLS4Lytg8aWD7L1++89T+OYJRxk
 M7hsRAxHowcOFouOYeJhE1iJlDoxadhZl3/zI4K3MISY2v8dlQKHuWiF0g2PMpS1dwVF
 8zjW9ywO3u+dwgqXwk4OzeNNVw0nVyAFinFxWgw80iE6jXcqi+ynHtcv0+lcirwDhBnx
 0MwQ==
X-Gm-Message-State: AOAM530YA/YRiNidzXU/6HxMLQJ22JAwOAfvfnf9bflTslgpLlg8MQEG
 B1lRnF4Bxtvi3UJ/pUATE8QoCg==
X-Google-Smtp-Source: ABdhPJzaC9nNQuKVHSa4dQb6+9eRJzS8/L1kl6NOzzKawO6uSmTDYgY/Yun1/Kkk0XX4EZ3jxftvJw==
X-Received: by 2002:aed:2b03:: with SMTP id p3mr22921117qtd.167.1606752502767; 
 Mon, 30 Nov 2020 08:08:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id c27sm16061169qkk.57.2020.11.30.08.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:08:21 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kjliv-0045Oj-20; Mon, 30 Nov 2020 12:08:21 -0400
Date: Mon, 30 Nov 2020 12:08:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <20201130160821.GB5487@ziepe.ca>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 12:55:41PM -0800, Jianxin Xiong wrote:
>  
> +function(rdma_multifile_module PY_MODULE MODULE_NAME LINKER_FLAGS)

I think just replace rdma_cython_module with this? No good reason I
can see to have two APIs?

> +  set(ALL_CFILES "")
> +  foreach(SRC_FILE ${ARGN})
> +    get_filename_component(FILENAME ${SRC_FILE} NAME_WE)
> +    get_filename_component(DIR ${SRC_FILE} DIRECTORY)
> +    get_filename_component(EXT ${SRC_FILE} EXT)
> +    if (DIR)
> +      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${DIR}")
> +    else()
> +      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
> +    endif()
> +    if (${EXT} STREQUAL ".pyx")
> +      set(PYX "${SRC_PATH}/${FILENAME}.pyx")
> +      set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
> +      include_directories(${PYTHON_INCLUDE_DIRS})
> +      add_custom_command(
> +        OUTPUT "${CFILE}"
> +        MAIN_DEPENDENCY "${PYX}"
> +        COMMAND ${CYTHON_EXECUTABLE} "${PYX}" -o "${CFILE}"
> +        "-I${PYTHON_INCLUDE_DIRS}"
> +        COMMENT "Cythonizing ${PYX}"
> +      )
> +      set(ALL_CFILES "${ALL_CFILES};${CFILE}")
> +    elseif(${EXT} STREQUAL ".c")
> +      set(CFILE_ORIG "${SRC_PATH}/${FILENAME}.c")
> +      set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
> +      if (NOT ${CFILE_ORIG} STREQUAL ${CFILE})
> +        rdma_create_symlink("${CFILE_ORIG}" "${CFILE}")
> +      endif()

Why does this need the create_symlink? The compiler should work OK
from the source file?

> +      set(ALL_CFILES "${ALL_CFILES};${CFILE}")
> +    elseif(${EXT} STREQUAL ".h")
> +      set(HFILE_ORIG "${SRC_PATH}/${FILENAME}.h")
> +      set(HFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.h")
> +      if (NOT ${HFILE_ORIG} STREQUAL ${HFILE})
> +        rdma_create_symlink("${HFILE_ORIG}" "${HFILE}")

Here too? You probably don't need to specify h files at all, at worst
they should only be used with publish_internal_headers

> +      endif()
> +    else()
> +      continue()
> +    endif()
> +  endforeach()
> +  string(REGEX REPLACE "\\.so$" "" SONAME "${MODULE_NAME}${CMAKE_PYTHON_SO_SUFFIX}")
> +  add_library(${SONAME} SHARED ${ALL_CFILES})
> +  set_target_properties(${SONAME} PROPERTIES
> +    COMPILE_FLAGS "${CMAKE_C_FLAGS} -fPIC -fno-strict-aliasing -Wno-unused-function -Wno-redundant-decls -Wno-shadow -Wno-cast-function-type -Wno-implicit-fallthrough -Wno-unknown-warning -Wno-unknown-warning-option -Wno-deprecated-declarations ${NO_VAR_TRACKING_FLAGS}"

Ugh, you copy and pasted this, but it shouldn't have existed in the
first place. Compiler arguments like this should not be specified
manually. I should fix it..

Also you should cc edward on all this pyverbs stuff, he knows it all
very well

It all looks reasonable to me

Jason

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
